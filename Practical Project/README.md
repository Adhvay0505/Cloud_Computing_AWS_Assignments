## VM NAS with k3s Nextcloud & AWS S3 Backup

A production-ready Network Attached Storage (NAS) built on a Linux VM, featuring Samba file sharing, k3s-hosted Nextcloud web UI, and automated two-way synchronization with AWS S3. Demonstrates container orchestration, persistent storage, and hybrid cloud-local backup architecture.​

### Features
- Samba NAS: Network file sharing via SMB (\\192.168.122.116\nasdata)

- Nextcloud Web UI: File management via k3s (http://192.168.122.116:30080)

- Persistent Storage: Shared /srv/nas/data between Samba + k3s pods

- AWS S3 Backup: Two-way sync with s3 bucket

- Optional Automated Sync: Hourly cron job maintains cloud-local consistency

### Architecture

Linux VM (Ubuntu)
├── k3s Kubernetes
│   └── Nextcloud Pod (PVC → /srv/nas/data/k8s/nextcloud)
│   └── Samba (SMB sharing: /srv/nas/data)
└── Cron → AWS CLI sync (↔ s3://bannerbucket69)

### Quick Demo
- Mount Samba: sudo mount -t cifs //192.168.122.116/nasdata /mnt/nasdata -o guest

- Access Web UI: Open http://192.168.122.116:30080

- Upload file in Nextcloud → appears in Samba mount

- Run sync: /usr/local/bin/nas_sync.sh

- Verify S3: aws s3 ls s3://bannerbucket69/


