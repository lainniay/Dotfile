#!/usr/bin/env ruby

require "yaml"

BASE_DIR = File.expand_path("..", __dir__)
RAW_PATH = File.join(BASE_DIR, "providers", "raw.yaml")
AIRPORT_PATH = File.join(BASE_DIR, "providers", "airport.yaml")

REGIONS = [
  ["HongKong", /香港|Hong\s*Kong/i],
  ["Singapore", /新加坡|狮城|獅城|Singapore/i],
  ["Japan", /日本|Japan/i],
  ["Taiwan", /台湾|台灣|Taiwan/i],
  ["UnitedStates", /美国|美國|United\s*States|America/i],
  ["Korea", /韩国|韓國|Korea/i],
  ["UnitedKingdom", /英国|英國|United\s*Kingdom|Britain/i],
  ["Indonesia", /印度尼西亚|印尼|Indonesia/i],
  ["India", /印度|India/i],
  ["Germany", /德国|德國|Germany/i],
  ["Brazil", /巴西|Brazil/i],
  ["Australia", /澳大利亚|澳大利亞|Australia/i],
  ["UnitedArabEmirates", /阿联酋|阿聯酋|UAE|United\s*Arab\s*Emirates/i],
  ["Russia", /俄罗斯|俄羅斯|Russia/i],
  ["Malaysia", /马来西亚|馬來西亞|Malaysia/i],
  ["Vietnam", /越南|Vietnam/i],
  ["Thailand", /泰国|泰國|Thailand/i],
  ["Kazakhstan", /哈萨克斯坦|哈薩克斯坦|Kazakhstan/i],
  ["Sweden", /瑞典|Sweden/i],
  ["France", /法国|法國|France/i],
  ["Turkey", /土耳其|Turkey/i],
  ["Egypt", /埃及|Egypt/i],
  ["SouthAfrica", /南非|South\s*Africa/i],
  ["Ukraine", /乌克兰|烏克蘭|Ukraine/i],
  ["Lithuania", /立陶宛|Lithuania/i],
  ["Switzerland", /瑞士|Switzerland/i],
  ["Canada", /加拿大|Canada/i],
  ["Hungary", /匈牙利|Hungary/i],
  ["Togo", /多哥|Togo/i],
  ["Italy", /意大利|Italy/i],
  ["Norway", /挪威|Norway/i],
  ["Czech", /捷克|Czech/i],
  ["Cambodia", /柬埔寨|Cambodia/i],
  ["Azerbaijan", /阿塞拜疆|Azerbaijan/i],
  ["Israel", /以色列|Israel/i],
  ["Poland", /波兰|波蘭|Poland/i],
  ["Spain", /西班牙|Spain/i],
  ["Mexico", /墨西哥|Mexico/i],
  ["Chile", /智利|Chile/i],
  ["Colombia", /哥伦比亚|哥倫比亞|Colombia/i]
].freeze

raw = YAML.safe_load(File.read(RAW_PATH), aliases: true)
source = raw.fetch("proxies")
counts = Hash.new(0)

proxies = source.each_with_object([]) do |proxy, output|
  original_name = proxy.fetch("name").to_s
  region = REGIONS.find { |_, pattern| original_name.match?(pattern) }&.first
  next unless region

  label = original_name.match?(/直连\s*\*0\.3/) ? "#{region} Fast" : region
  counts[label] += 1

  renamed = proxy.dup
  renamed["name"] = format("%<label>s %<number>02d", label: label, number: counts[label])
  output << renamed
end

abort "no proxies generated from #{RAW_PATH}" if proxies.empty?

File.write(AIRPORT_PATH, YAML.dump({ "proxies" => proxies }))
puts "generated #{proxies.length} proxies -> #{AIRPORT_PATH}"
