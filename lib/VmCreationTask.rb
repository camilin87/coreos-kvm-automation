require "TaskConfig"
require "VmManagerFactory"

class VmCreationTask
    def initialize(config: TaskConfig.new)
        @config = config
        @vm_manager = VmManagerFactory.create @config
    end

    def run
        @vm_manager.generate_vm_config_drive @config.public_key_filename
        @vm_manager.create_vm_hdd @config.base_image_filename
    end
end