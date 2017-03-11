require "TaskConfig"

describe "TaskConfig" do
    it "returns default values when nothing is specified" do
        r = TaskConfig.new()

        expect(r.storage_folder).to eq(File.expand_path("~/vms"))
        expect(r.public_key_filename).to eq(File.expand_path("~/.ssh/id_rsa.pub"))
        expect(r.base_image_filename).to eq("")
        expect(r.vm_name).to eq("vm01")
        expect(r.mac_address).to eq("54:36:E2:84:5A:C0")
        expect(r.bridge_adapter).to eq("br0")
        expect(r.ram_mb).to eq("1024")
        expect(r.cpu_count).to eq("1")
    end

    it "parses the parameters" do
        r = TaskConfig.new([
            "--path", "/var/vms/data",
            "--key", "/etc/secrets/key.pub",
            "--img", "~/ubuntu.img",
            "--name", "vm45",
            "--mac", "00:00:00:01",
            "--br", "vbr1",
            "--ram", "2048",
            "--cpu", "4"])

        expect(r.storage_folder).to eq("/var/vms/data")
        expect(r.public_key_filename).to eq("/etc/secrets/key.pub")
        expect(r.base_image_filename).to eq(File.expand_path("~/ubuntu.img"))
        expect(r.vm_name).to eq("vm45")
        expect(r.mac_address).to eq("00:00:00:01")
        expect(r.bridge_adapter).to eq("vbr1")
        expect(r.ram_mb).to eq("2048")
        expect(r.cpu_count).to eq("4")
    end
end