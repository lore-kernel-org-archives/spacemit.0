Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4883655C7
	for <spacemit@lists.linux.dev>; Sat, 22 Aug 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389101; cv=pass; b=Utg0zC+Ne5/epmRyTCOe+EiKni+7Xe+Drjyyb2F49UYcvm4EXVucSKkD0ay1i5JUOlNVA0n8BeJopJYlYV05Z1BoeRqIVYRREyP/T6J6fwRSo0xS+kiWML2f8tob4A55yx+4gkUK8b87WV6n7gClmF2xQID5Z6p0+eywoUqHXuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389101; c=relaxed/simple;
	bh=WprfhXQP87Zvs00PODGY6TMF51/uDxKiCUSciP41FxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urHuo33aElobwiigIEahdHXHEB6ueHUZxyp5DdLzKOTV8qW0igNCEl4Qcunly2gZF9puWhHxFMKV1tIRu60a9pp1HL2hpW4bGRxmGvjvWKvl0NrQayZa0ja0YqlGiZE+llKMHjveI0pKkfYCHsSLLl9yyMPjInCTh6Y4rECDvaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=KMwXQmvv; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="KMwXQmvv"
ARC-Seal: i=1; a=rsa-sha256; t=1787389093; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=crpdbcQYWFz9PCKmTXxap3/mlU2VotmkCKD1Smwn1H0+2TxsVdPan4HixTJtyapmr6h925fdRilW/cqGjTe9JtuJHVEVSeBP3IaRRVkFjq/Q2aS0jEFS4blpUmL/ZU4EHK6CPKtSfnj00t9OkEMsqg/gZvKB3kA/c1NQD5zfcWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787389093; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z4ly39pIcQfpCaRIy+B10T9AQH3pHVh+EW6Cbwjcb8o=; 
	b=MYq7qeSA2bCfTyhPF55b7V7pUVfsK3UmFSblrvT9Y8ALAeVIUpYrXABl94YSoj/0QCIS6juXOkRmJMmUHS/BnPq5jveBPZHmou617sLXmYxPqRvtFJjI/54UFiNkeg1zvWivFCM86Aq3QELtgFUACsYdIbeVzDyqvNuMSiSBVHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787389093;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=z4ly39pIcQfpCaRIy+B10T9AQH3pHVh+EW6Cbwjcb8o=;
	b=KMwXQmvvbmPZozqQNJO888TMVqrvX4O3BQ4GA42FMaRo1pyFqtYzNTWGUZIhvecz
	iZFb9dRHNlyjeA8ltToGXQeh/uJJQldGpfas9ErLq/A07dzIDXeAqthmueHeSH87NRq
	JpuXpK4GZScWKgO00rLuP82y0/Sozuez63JZ8r0k=
Received: by mx.zohomail.com with SMTPS id 1787389090291438.9463218934003;
	Sat, 22 Aug 2026 01:58:10 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 22 Aug 2026 16:56:47 +0800
Subject: [PATCH 1/2] tools: mkimage: add SpacemiT K3 AIHD image support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-spacemit-aihd-v1-1-bf4c41993891@pigmoral.tech>
References: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
In-Reply-To: <20260822-spacemit-aihd-v1-0-bf4c41993891@pigmoral.tech>
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Yixun Lan <dlan@kernel.org>, 
 spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8969;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=WprfhXQP87Zvs00PODGY6TMF51/uDxKiCUSciP41FxU=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLI6UzrPPj7g0Vm2/6nVNkeOhjU3Re98YJ//WNHnqMDpl
 /+evTBJ7ChlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAivqoM/3SOrd3INMU9OWyX
 lsrUD4kik3TrJUWufzFN187blNbyahbD/+D/GmXMXu5pXBVPUsWPJzxg/5hTGG966H/jliiLy/P
 Z2AE=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT BootROM loads the FSBL from an AIHD image: a fixed 4 KiB
header with two metadata headers and authentication information, followed
by a 32-byte-aligned SPL payload and a trailing authentication area. K1
and K3 share the same layout, but use different integrity and
authentication schemes. K1 requires RSA-signed images, while K3 uses
CRC32 to verify images in non-secure boot mode.

Add mkimage type "aihdimage" for the K3 CRC32 path. Populate both
metadata headers, fill their CRC32 values and the payload CRC32, and
reserve the authentication areas required by the layout. Only "-n k3" is
wired up so far, but SoC differences already go through a variant table
so K1 RSA signing can be added later.

The AIHD header has no reliable K1/K3 identifier, so the SoC is selected
with -n. dumpimage is omitted for the same reason: it cannot take -n and
therefore cannot differentiate between the two variants.

Only support for non-secure boot mode on the K3 SoC is implemented in
this patch. K1 support and the RSA authentication scheme can be added
later.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 boot/image.c      |   1 +
 include/image.h   |   1 +
 tools/Makefile    |   3 +-
 tools/aihdimage.c | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+), 1 deletion(-)

diff --git a/boot/image.c b/boot/image.c
index 185d52ba492f..8dbfb677e631 100644
--- a/boot/image.c
+++ b/boot/image.c
@@ -179,6 +179,7 @@ static const table_entry_t uimage_type[] = {
 	{	IH_TYPE_TFA_BL31, "tfa-bl31",  "TFA BL31 Image", },
 	{	IH_TYPE_STM32IMAGE_V2, "stm32imagev2", "STMicroelectronics STM32 Image V2.0" },
 	{	IH_TYPE_AMLIMAGE,   "amlimage",   "Amlogic Boot Image" },
+	{	IH_TYPE_AIHDIMAGE, "aihdimage", "SpacemiT AIHD Boot Image" },
 	{	-1,		    "",		  "",			},
 };
 
diff --git a/include/image.h b/include/image.h
index 6edcb1995bfe..7d101960cac6 100644
--- a/include/image.h
+++ b/include/image.h
@@ -235,6 +235,7 @@ enum image_type_t {
 	IH_TYPE_TFA_BL31,		/* TFA BL31 image */
 	IH_TYPE_STM32IMAGE_V2,		/* STMicroelectronics STM32 Image V2.0 */
 	IH_TYPE_AMLIMAGE,		/* Amlogic Boot Image */
+	IH_TYPE_AIHDIMAGE,		/* SpacemiT AIHD Boot Image */
 
 	IH_TYPE_COUNT,			/* Number of image types */
 };
diff --git a/tools/Makefile b/tools/Makefile
index 535a5d51c89e..e838e16e0f05 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -110,7 +110,8 @@ KWB_IMAGE_OBJS-$(CONFIG_TOOLS_LIBCRYPTO) := kwbimage.o
 ROCKCHIP_OBS = generated/lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
 
 # common objs for dumpimage and mkimage
-dumpimage-mkimage-objs := aisimage.o \
+dumpimage-mkimage-objs := aihdimage.o \
+			aisimage.o \
 			amlimage.o \
 			atmelimage.o \
 			$(FIT_OBJS-y) \
diff --git a/tools/aihdimage.c b/tools/aihdimage.c
new file mode 100644
index 000000000000..e4e9ecdd97d9
--- /dev/null
+++ b/tools/aihdimage.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
+ *
+ * The SpacemiT AIHD boot image consists of a fixed image header followed by an
+ * aligned SPL payload and a trailing authentication area. The image header
+ * contains two metadata headers and areas reserved for authentication data.
+ *
+ * The image layout is:
+ *
+ *   0x000             root key
+ *   0x100             header0
+ *   0x120             key metadata
+ *   0x300             OEM keys
+ *   0xb00             signature0
+ *   0xfe0             header1
+ *   0x1000            SPL payload, with its end aligned to 32 bytes
+ *   payload end       signature1 (0x100 bytes)
+ */
+
+#include <image.h>
+#include <u-boot/crc.h>
+#include "imagetool.h"
+
+#define AIHD_MAGIC		"AIHD"
+#define AIHD_PAYLOAD_ALIGN	32
+#define AIHD_AUTH_SIZE		0x100
+
+#define AIHD_FLAG_CRC32		(1U << 0)
+
+/**
+ * struct aihdimage_header - metadata header within an AIHD image header
+ *
+ * @magic:	Magic (must be AIHD_MAGIC)
+ * @version:	Image version used when anti-rollback is enabled by eFuse
+ * @secure:	Version slot used when anti-rollback is enabled by eFuse
+ * @reserved:	Reserved
+ * @image_size:	Header0 stores the image header size
+ *		Header1 stores the aligned payload size
+ * @load_addr:	Unused
+ * @header_crc:	Header0 and Header1 store the CRC32 of the preceding 24 bytes on K3
+ * @image_crc:	Header1 stores the CRC32 of the aligned payload on K3
+ */
+struct aihdimage_header {
+	uint8_t magic[4];
+	uint8_t version;
+	uint8_t secure;
+	uint16_t reserved;
+	uint64_t image_size;
+	uint64_t load_addr;
+	uint32_t header_crc;
+	uint32_t image_crc;
+} __packed;
+
+/**
+ * struct aihdimage_image_header - fixed header area of an AIHD image
+ *
+ * @root_key:	Root public key
+ * @header0:	Image layout and load information
+ * @key_data:	Key metadata
+ * @oem_keys:	OEM public-key area
+ * @signature0:	Signature of the image configuration
+ * @reserved:	Reserved
+ * @header1:	SPL payload information
+ */
+struct aihdimage_image_header {
+	uint8_t root_key[0x100];
+	struct aihdimage_header header0;
+	uint8_t key_data[0x1e0];
+	uint8_t oem_keys[0x800];
+	uint8_t signature0[AIHD_AUTH_SIZE];
+	uint8_t reserved[0x3e0];
+	struct aihdimage_header header1;
+} __packed;
+
+/**
+ * struct aihdimage_variant - SoC-specific AIHD properties
+ *
+ * @name:	SoC name passed to mkimage with -n
+ * @flags:	SoC-specific AIHD flags
+ */
+struct aihdimage_variant {
+	const char *name;
+	unsigned int flags;
+};
+
+static const struct aihdimage_variant aihdimage_variants[] = {
+	{
+		.name = "k3",
+		.flags = AIHD_FLAG_CRC32,
+	},
+};
+
+static const struct aihdimage_variant *aihdimage_get_variant(const char *name)
+{
+	int i;
+
+	if (!name || !*name)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(aihdimage_variants); i++)
+		if (!strcmp(name, aihdimage_variants[i].name))
+			return &aihdimage_variants[i];
+
+	return NULL;
+}
+
+static void aihdimage_init_header(struct aihdimage_header *header, uint64_t image_size,
+				  const struct aihdimage_variant *variant)
+{
+	uint32_t crc;
+
+	memcpy(header->magic, AIHD_MAGIC, sizeof(header->magic));
+
+	header->image_size = cpu_to_le64(image_size);
+
+	if (variant->flags & AIHD_FLAG_CRC32) {
+		crc = crc32(0, (uint8_t *)header,
+			    offsetof(struct aihdimage_header, header_crc));
+		header->header_crc = cpu_to_le32(crc);
+	}
+}
+
+static int aihdimage_check_params(struct image_tool_params *params)
+{
+	if (!aihdimage_get_variant(params->imagename)) {
+		fprintf(stderr, "%s: SpacemiT SoC must be specified with -n\n",
+			params->cmdname);
+		return EXIT_FAILURE;
+	}
+
+	if (!params->dflag)
+		return EXIT_FAILURE;
+
+	return EXIT_SUCCESS;
+}
+
+static void aihdimage_print_header(const void *buf, struct image_tool_params *params)
+{
+	const struct aihdimage_image_header *image_header = buf;
+	const struct aihdimage_header *header1 = &image_header->header1;
+	uint64_t payload_size = le64_to_cpu(header1->image_size);
+
+	printf("SpacemiT AIHD Boot Image (%s)\n", params->imagename);
+	printf("Total Size: %llu bytes\n",
+	       (unsigned long long)(sizeof(*image_header) + payload_size + AIHD_AUTH_SIZE));
+	printf("Payload Size: %llu bytes\n", (unsigned long long)payload_size);
+}
+
+static void aihdimage_set_header(void *buf, struct stat *sbuf, int infd,
+				 struct image_tool_params *params)
+{
+	const struct aihdimage_variant *variant = aihdimage_get_variant(params->imagename);
+	struct aihdimage_image_header *image_header = buf;
+	struct aihdimage_header *header0 = &image_header->header0;
+	struct aihdimage_header *header1 = &image_header->header1;
+	size_t payload_size;
+	uint32_t crc;
+
+	payload_size = sbuf->st_size - sizeof(*image_header) - AIHD_AUTH_SIZE;
+
+	aihdimage_init_header(header0, sizeof(*image_header), variant);
+	aihdimage_init_header(header1, payload_size, variant);
+
+	if (variant->flags & AIHD_FLAG_CRC32) {
+		crc = crc32(0, (uint8_t *)(image_header + 1), payload_size);
+		header1->image_crc = cpu_to_le32(crc);
+	}
+}
+
+static int aihdimage_check_image_type(uint8_t type)
+{
+	if (type == IH_TYPE_AIHDIMAGE)
+		return EXIT_SUCCESS;
+
+	return EXIT_FAILURE;
+}
+
+static int aihdimage_vrec_header(struct image_tool_params *params,
+				 struct image_type_params *tparams)
+{
+	size_t payload_size = params->file_size - tparams->header_size;
+
+	tparams->hdr = calloc(tparams->header_size, 1);
+
+	return ALIGN(payload_size, AIHD_PAYLOAD_ALIGN) - payload_size + AIHD_AUTH_SIZE;
+}
+
+U_BOOT_IMAGE_TYPE(
+	aihdimage,
+	"SpacemiT AIHD Boot Image support",
+	sizeof(struct aihdimage_image_header),
+	NULL,
+	aihdimage_check_params,
+	NULL,
+	aihdimage_print_header,
+	aihdimage_set_header,
+	NULL,
+	aihdimage_check_image_type,
+	NULL,
+	aihdimage_vrec_header
+);

-- 
2.55.0

