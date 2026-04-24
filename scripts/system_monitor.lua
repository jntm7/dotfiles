-- system_monitor.lua

local function print_system_status()
  local cpu_usage = os.execute("top -bn1 | grep " .. "CPU(s)" .. " | sed " .. "s/[^[:space:]]//g")
  local mem_usage = os.execute("free -h | grep " .. "Mem" .. " | awk '{print $3}'")
  local disk_usage = os.execute("df -h / | grep " .. "Total" .. " | awk '{print $2}'")
  local uptime = os.execute("uptime | awk '{print $1 " " $2}'")
  
  print("\nSystem Status:")
  print("CPU Usage: " .. cpu_usage .. "%")
  print("Memory Usage: " .. mem_usage .. "%")
  print("Disk Usage: " .. disk_usage .. "%")
  print("Uptime: " .. uptime .. " (system: " .. os.time() .. " seconds)")
end

print_system_status()
