Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1164ED1BE
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563524; cv=pass; b=NTISfRWJ9/P07iLE1gkR2b2rySJIDTU3PkPs1IAa6OLFUWFIewZ/DMruUmMa2R/l6MGK4lPv+QrDELwe2J8D6uEjgFaONVmK6blGL35FJJfYgH8s3BuJbm578Z6L47YE3b2IsH8CVbBzClCiT+K9q9DTGxG8gF89WcqIwmGL0lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563524; c=relaxed/simple;
	bh=GdurkpAiSpuIK6F0HraBfiviBCUfmP4VUgKERg0fv60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoTfVfn76k1Wu5G2KIVVc1M3be4MoTRigfR93BhTk8F3d8v3KiLj6Um5Qmf11uwXozi+oKd2wMabLLOhb5lV8Ee/LYr/WLQkOagPNaEqml/6VJtCIlKPwznjLBwwYDZdtYNho4VckkbEfaqxh/NSZg/2zzmSZaOV1PIYDve/4QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=qnyPsD94; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="qnyPsD94"
ARC-Seal: i=1; a=rsa-sha256; t=1791563507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iGPThO6AAPSZC96zNhuuLddx/Yfm5h60VCtkHMj33f5ooSOND71QjDmUS/cR08BymZXssXKekENXKKiupmtZLmk1v8QV9e+LMarJOXMDXo8WkKlS0x8lMOHbig5j181JsGOQNPzhklNL0PWYtUJL8UOAs2N+IIFPaDM99CCfVzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791563507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bHM6dm7z36twaWUQynfYdfHvUZZTagM/0kJNKvL0e4w=; 
	b=e8Q9ncRv4ovYIycxiOMZCQa5t8JMmMuUuhiKwcVzUMhDEpaKiwGDnOtNl4XvS4d4QOnIWNYEB6yvagnfh0ySl8B4Qvo/NOpgwFPLqAv6HTrwy6MnOWudkPjYqUN5p7p8t3pAK4kGU70Zmunv9SLBGQ9S0JA7NqTifbEaDDBflrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791563507;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bHM6dm7z36twaWUQynfYdfHvUZZTagM/0kJNKvL0e4w=;
	b=qnyPsD94f6WPpTDvVS27t+KCcNwbakQdcxwCKpfagcIALroKb3GiL12I6XCaBP93
	5qwflv27ZeCWAIyCXmP3kLnS5BFTr+9fKVFH0Y0Im3xnXZzrtzZsPW6/jeAW3kJzk9s
	kmhxN6vpxnyUyPybdm6lEhoaoxsIlNcJW1r5Blwc=
Received: by smtp.zohomail.com with SMTPS id 1791563498729774.1450215126099;
	Fri, 9 Oct 2026 09:31:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 10 Oct 2026 00:31:07 +0800
Subject: [PATCH v4 1/2] tools: mkimage: add SpacemiT K3 boot image support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-spacemit-aihd-v4-1-e7152ae4d71a@pigmoral.tech>
References: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
In-Reply-To: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Glass <sjg@chromium.org>, 
 Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Kory Maincent <kory.maincent@bootlin.com>, E Shattow <e@freeshell.de>, 
 Yixun Lan <dlan@kernel.org>, Yao Zi <me@ziyao.cc>, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8892;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=GdurkpAiSpuIK6F0HraBfiviBCUfmP4VUgKERg0fv60=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLJOil07u+5l5r//S3nPqDRfELusMT+m8FDzD4clEwu32
 Us1ru326yhlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAiMgqMDIvX9/bdCovfJyD8
 u9Y889G3vf+sJRaWyX9cfvD9AXX9l2WMDBNfJev3r4lImBaRL3xgyams4w+edL7ebs4/e3IGx2Z
 bY2YA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT BootROM loads the FSBL from a boot image consisting of a
fixed 4 KiB header with two metadata headers and authentication
information, followed by a 32-byte-aligned SPL payload and a trailing
authentication area. K1 and K3 share the same layout, but use different
integrity and authentication schemes. K1 requires RSA-signed images,
while K3 uses CRC32 to verify images in non-secure boot mode.

Add mkimage type "smtimage" for the K3 CRC32 path. Populate both
metadata headers, fill their CRC32 values and the payload CRC32, and
reserve the authentication areas required by the layout.

The K1 and K3 image headers cannot be easily differentiated, and
dumpimage has no way to select the variant, so dumpimage support is
not implemented.

mkimage selects the SoC variant with "-n <soc>". For now only
"-n k3" with non-secure boot (CRC32) is supported. A variant table
is added to hold the SoC-specific parameters, making it easier to
add K1 support and RSA authentication later.

Tested-by: E Shattow <e@freeshell.de>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 boot/image.c     |   1 +
 include/image.h  |   1 +
 tools/Makefile   |   1 +
 tools/smtimage.c | 208 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 211 insertions(+)

diff --git a/boot/image.c b/boot/image.c
index 185d52ba492f..289e80f23a7f 100644
--- a/boot/image.c
+++ b/boot/image.c
@@ -179,6 +179,7 @@ static const table_entry_t uimage_type[] = {
 	{	IH_TYPE_TFA_BL31, "tfa-bl31",  "TFA BL31 Image", },
 	{	IH_TYPE_STM32IMAGE_V2, "stm32imagev2", "STMicroelectronics STM32 Image V2.0" },
 	{	IH_TYPE_AMLIMAGE,   "amlimage",   "Amlogic Boot Image" },
+	{	IH_TYPE_SMTIMAGE,   "smtimage",   "SpacemiT Boot Image" },
 	{	-1,		    "",		  "",			},
 };
 
diff --git a/include/image.h b/include/image.h
index 5248ca98d411..f059fc5811c0 100644
--- a/include/image.h
+++ b/include/image.h
@@ -235,6 +235,7 @@ enum image_type_t {
 	IH_TYPE_TFA_BL31,		/* TFA BL31 image */
 	IH_TYPE_STM32IMAGE_V2,		/* STMicroelectronics STM32 Image V2.0 */
 	IH_TYPE_AMLIMAGE,		/* Amlogic Boot Image */
+	IH_TYPE_SMTIMAGE,		/* SpacemiT Boot Image */
 
 	IH_TYPE_COUNT,			/* Number of image types */
 };
diff --git a/tools/Makefile b/tools/Makefile
index 535a5d51c89e..fc0aa52455aa 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -138,6 +138,7 @@ dumpimage-mkimage-objs := aisimage.o \
 			pbl_crc32.o \
 			renesas_spkgimage.o \
 			sfspl.o \
+			smtimage.o \
 			vybridimage.o \
 			stm32image.o \
 			$(ROCKCHIP_OBS) \
diff --git a/tools/smtimage.c b/tools/smtimage.c
new file mode 100644
index 000000000000..462279e80a3f
--- /dev/null
+++ b/tools/smtimage.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
+ *
+ * The SpacemiT boot image consists of a fixed image header followed by an
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
+#include "imagetool.h"
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <u-boot/crc.h>
+
+#define SMT_MAGIC		"AIHD"
+#define SMT_AUTH_SIZE		0x100
+
+#define SMT_FLAG_CRC32		(1U << 0)
+
+/**
+ * struct smtimage_header - metadata header within a SpacemiT boot image header
+ *
+ * @magic:	Magic (must be SMT_MAGIC)
+ * @version:	Image version used when anti-rollback is enabled by eFuse
+ * @secure:	Version slot used when anti-rollback is enabled by eFuse
+ * @reserved:	Reserved
+ * @image_size:	Header0 stores the image header size
+ *		Header1 stores the aligned payload size
+ * @load_addr:	Unused
+ * @header_crc:	Header0 and Header1 store the CRC32 of the preceding 24 bytes on K3
+ * @image_crc:	Header1 stores the CRC32 of the aligned payload on K3
+ */
+struct smtimage_header {
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
+ * struct smtimage_image_header - fixed header area of a SpacemiT boot image
+ *
+ * @root_key:	Root public key
+ * @header0:	Image layout and load information
+ * @key_data:	Key metadata
+ * @oem_keys:	OEM public-key area
+ * @signature0:	Signature of the image configuration
+ * @reserved:	Reserved
+ * @header1:	SPL payload information
+ */
+struct smtimage_image_header {
+	uint8_t root_key[0x100];
+	struct smtimage_header header0;
+	uint8_t key_data[0x1e0];
+	uint8_t oem_keys[0x800];
+	uint8_t signature0[SMT_AUTH_SIZE];
+	uint8_t reserved[0x3e0];
+	struct smtimage_header header1;
+} __packed;
+
+/**
+ * struct smtimage_variant - SoC-specific image properties
+ *
+ * @name:	SoC name passed to mkimage with -n
+ * @flags:	SoC-specific image flags
+ */
+struct smtimage_variant {
+	const char *name;
+	unsigned int flags;
+};
+
+static const struct smtimage_variant smtimage_variants[] = {
+	{
+		.name = "k3",
+		.flags = SMT_FLAG_CRC32,
+	},
+};
+
+static const struct smtimage_variant *smtimage_get_variant(const char *name)
+{
+	int i;
+
+	if (!name)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(smtimage_variants); i++)
+		if (!strcmp(name, smtimage_variants[i].name))
+			return &smtimage_variants[i];
+
+	return NULL;
+}
+
+static void smtimage_init_header(struct smtimage_header *header, uint64_t image_size,
+				 const struct smtimage_variant *variant)
+{
+	uint32_t crc;
+
+	memcpy(header->magic, SMT_MAGIC, sizeof(header->magic));
+
+	header->image_size = cpu_to_le64(image_size);
+
+	if (variant->flags & SMT_FLAG_CRC32) {
+		crc = crc32(0, (uint8_t *)header,
+			    offsetof(struct smtimage_header, header_crc));
+		header->header_crc = cpu_to_le32(crc);
+	}
+}
+
+static int smtimage_check_params(struct image_tool_params *params)
+{
+	if (!smtimage_get_variant(params->imagename)) {
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
+static void smtimage_print_header(const void *buf, struct image_tool_params *params)
+{
+	const struct smtimage_image_header *image_header = buf;
+	const struct smtimage_header *header1 = &image_header->header1;
+	uint64_t payload_size = le64_to_cpu(header1->image_size);
+
+	printf("Image Type:   SpacemiT Boot Image\n");
+	printf("SoC Variant:  %s\n", params->imagename);
+	printf("Total Size:   %llu bytes\n",
+	       (unsigned long long)(sizeof(*image_header) + payload_size + SMT_AUTH_SIZE));
+	printf("Payload Size: %llu bytes\n", (unsigned long long)payload_size);
+}
+
+static void smtimage_set_header(void *buf, struct stat *sbuf, int infd,
+				struct image_tool_params *params)
+{
+	const struct smtimage_variant *variant = smtimage_get_variant(params->imagename);
+	struct smtimage_image_header *image_header = buf;
+	struct smtimage_header *header0 = &image_header->header0;
+	struct smtimage_header *header1 = &image_header->header1;
+	size_t payload_size;
+	uint32_t crc;
+
+	payload_size = sbuf->st_size - sizeof(*image_header) - SMT_AUTH_SIZE;
+
+	smtimage_init_header(header0, sizeof(*image_header), variant);
+	smtimage_init_header(header1, payload_size, variant);
+
+	if (variant->flags & SMT_FLAG_CRC32) {
+		crc = crc32(0, (uint8_t *)(image_header + 1), payload_size);
+		header1->image_crc = cpu_to_le32(crc);
+	}
+}
+
+static int smtimage_check_image_type(uint8_t type)
+{
+	if (type == IH_TYPE_SMTIMAGE)
+		return EXIT_SUCCESS;
+
+	return EXIT_FAILURE;
+}
+
+static int smtimage_vrec_header(struct image_tool_params *params,
+				struct image_type_params *tparams)
+{
+	size_t payload_size = params->file_size - tparams->header_size;
+
+	tparams->hdr = calloc(tparams->header_size, 1);
+
+	return ALIGN(payload_size, 32) - payload_size + SMT_AUTH_SIZE;
+}
+
+U_BOOT_IMAGE_TYPE(
+	smtimage,
+	"SpacemiT Boot Image support",
+	sizeof(struct smtimage_image_header),
+	NULL,
+	smtimage_check_params,
+	NULL,
+	smtimage_print_header,
+	smtimage_set_header,
+	NULL,
+	smtimage_check_image_type,
+	NULL,
+	smtimage_vrec_header
+);

-- 
2.55.0

