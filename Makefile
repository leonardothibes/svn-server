ID=$(shell id -u)

main   : help
install: .clear .permission .scripts
	@puppet apply --modulepath '/etc/puppet/modules:./puppet/modules' ./puppet/manifests/init.pp

backup: .clear .permission
	@sh /var/lib/backups/bkp-svn.sh

.permission:
	@if [ ${ID} != 0 ]; then \
		echo "Access denied: root permission is required!"; \
		exit 1; \
	fi;

.scripts:
	@./puppet/scripts/fqdn.sh
	@./puppet/scripts/update.sh
	@./puppet/scripts/puppet.sh

.clear:
	@clear

clean:
	@echo "Removing temporary files..."
	@rm -f /tmp/*.lock

help: .clear
	@echo "Install tool for USVN server"
	@echo "Usage: make [options]"
	@echo ""
	@echo "  install          Executa a instalacao do servidor."
	@echo "  backup           Inicia manualmente o processo de backup no S3."
	@echo "  clean            Limpa arquivos temporarios."
	@echo "  help             Exibe esta mensagem de HELP."
	@echo ""
