Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945234;
	b=c7pfjO431saMId63JdAtKdIYshPmQhtjQvCSKQVNRXey31uSFlOTEI2Hwze6GF5g8SLb
	 M3OwVY5RTBNuHe170OKK1bQ6aGXzYS+FVLjkkzPE161Ou+YhS5xGbz15PS3fHM0IPiyMQ
	 tyz5/5ZuOnjKJKCG02CLOOx7gl2ru6hg/fYc87Ljxh5Y6sZwc7bK5HxNJCkd/zEIqAmZC
	 Z70jcZqN5EP/9tS5QX7sUmCnlxRD2gE6uC+hDiVlwCUbEngIBIeAT5WJ3XdRXtqDO6Jlq
	 YvvfWnWbppESzLVf4goku/1rsncz1PZ/bp/0XY25hQzqnUA4kcyqBX6nsxUmy9jId3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
	b=QDGYZusD24w5nYlxz/t4+VL2rzzb/DBStSdQRlN+Tl8Mj4oxW5IqUh0tpypdaOu/bBWZ
	 yNdKYHsCLQlza2SK5b8ESPuRsQoHAM85WEq+dOmb2w3xryKUOZy88szYLB0Jya1IQMAT1
	 JE9tivqbGHiuqgPAqvyeRc1ELJX6+4tW/LLh42y+zmkldJgoj/0b+/xs8MyAVGd3XtbHM
	 BkL49hN6II2jSDyDa8VALXYyfp+GKqFVlSWbTr5L+lQ7pR2ercR3RLcExOtV7vHMDhCgY
	 tnDUmv06DFHIFVK6hBZ5Q7jfYQV2fCsVDKAXG2YXA8Gm9CebGXUoojEThah2EgrlkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uY6eZD47;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB0606A335
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 06:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CB0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uY6eZD47
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9b69so421042c88.0
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945233; x=1794550033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=uY6eZD47kFxRXOPyz6/UUqBY1H+gfxur6emOLxmGSqjvC9NNpdGxwFUR64aBBTAOav
         B/LbuLtcTILTQ7aorMaOnaEbuZsGNwr3sWJh11mywn+T/if+WqxaGz2CV+3FGeU4wdlq
         EuwFD+jXyCf6Rq6ThI7jOI8DEtIN5BaeyAxSJHqXCPr8LQa6iRhraiGVOMnDigbez/lo
         STdibf64uAGP6Cdow9CHyYuF3pbYrKvlWXY6POArZMmruXtPb5BdGn7FfKzEDTc+sonh
         /KiwQeC+egfniyqC2AuAjXnFlEhFrxZ/AwSkMkTy63TgqUm/iQ2yr6XPvWokEUXMn8oP
         oATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945233; x=1794550033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=wc+KcW38xg9N1dW7o/mch2IZvwDckULkKmTF9DrCJvDqOk5g0FdAZKJ5RT2iVqjEEj
         Oo7CG1XwSiilcQX/B7p7V/FfXtuNeWccW/kGjPz3IdVU73GcotSaeercnPMucNUNAwIg
         A/E5YASQnBveDYS1FbXhAJrzIpCcY24GWEiDURES1L20Q2LCYqmVLNvkzt62rG5NKT2w
         A1ZeNiV+ULFSpidU0P1zpy/leCkhTw4r5866QIxlr+ECE/332Mf6pEd4cmTS4Csjyvlt
         Ao6cq05VmpR3ROs1YkvkiBdFAMdQ1UiV6+N+6doMLgBubf+dUNJ3E50yt5Y7YvBbkpLo
         MSXg==
X-Forwarded-Encrypted: i=1; AKwUvBxpBDJhm0DnRcb2iS1Y+SuOpKOFnAk5Ttj4QTlrm7+PbWWHiZ90DPR+KjgJhEMVM2zuuj8JKW9ZeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/aJxlLnySMjUfLrLlK4sSkEGCZkrBH42s2AyaRtF/CwbOH6cmZ
	vAlqrCZClZDV+Ryl+1iuWOAZ1LUQtJ+2Q4owm19BJZFBzPQcuw4QppfQ
X-Gm-Gg: AYBFou040zs056fOSpHlkgU4YYudoi+d+uZ070TCQUldqDRwM64oDl6AVT42UvyxUDQ
	ViODzOIqxaNZLV241Cpj5cj6rzQ7gyg5JkLiWu2cS3UGIUfHcPua73Lu7CKCkBYa8SmpDHKOCSe
	xvi9065lf6rMZNbvYsaKMTYY+ITuDMfU0WPYFzQy7AMcu4mYJPi80YfWgEdlbq8GL0IpjfQudHo
	hNmCn+x9z7/ERTfbWCvHJU/SPHIYz8TCndLUTAuswy4XO2akTrnNeQey74jPSpRGe0RbzIAT1U8
	IRNrJ7RjKUDK7NwcloZgX3wNI2/nJayko34ASBl24a6i3iLbTXXdOjF0aD2vV/ntS7GX0qFNFWp
	oKi1uLMDSyxU2XjD+/UkPOdlslUs/vfcobticTGrcCqEIVhuNNZ0cRoqROfyva0Neh719ypneeo
	bbroUxk5ot7W1/KWka5X9eRfYlrSgw0Wnfema60fQ1j0ejUeyTuED8gTPRu1qt2QN3hQf2pko1b
	kGWKM2geTcq0ApL2O525jHPPXq5CFFFQkdKpKeoQsBsJ+GamFvnZ2zP6kmevRF1KiLAbW2HmMr6
	VcIyTsGcgPIfJ0vmCvX2V/cWscHLFBBmciHbwj0mxJt/Fv9qp7If
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1729112c88.8.1793945232552;
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:24 +0800
Message-ID: <20261106060525.346873-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
controller. These banks contain temperature calibration parameters and
other configuration data.

Snapshot the shadow registers with aligned 32-bit reads and expose the
data in little-endian order at controller-relative offsets. Serve reads
from the snapshot and use keepouts for the remaining register ranges.
Keep the AES_WTM clock enabled and its shared reset deasserted while the
provider is registered.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  14 +++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a9eb764ffee..e0af83ecee37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26529,6 +26529,7 @@ SPACEMIT K3 EFUSE DRIVER
 M:	Jiayu Du <duge1256@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+F:	drivers/nvmem/spacemit-k3-efuse.c
 
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..28d6c59fbd74 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK && RESET_CONTROLLER
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
+	  the shadow registers before Linux starts. Programming and reloading
+	  the fuses are not supported.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called spacemit-k3-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..d29716957faf 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SPACEMIT_K3_EFUSE)	+= spacemit-k3-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
new file mode 100644
index 000000000000..d106053beae8
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define K3_EFUSE_REG_SIZE		0x400
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_BANK0_OFFSET	0x104
+#define K3_EFUSE_BANK7_OFFSET	0x190
+
+static const unsigned int k3_efuse_bank_offsets[] = {
+	K3_EFUSE_BANK0_OFFSET,
+	K3_EFUSE_BANK7_OFFSET,
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = 0,
+		.end = K3_EFUSE_BANK0_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK0_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_REG_SIZE,
+	},
+};
+
+struct k3_efuse {
+	u8 data[ARRAY_SIZE(k3_efuse_bank_offsets)][K3_EFUSE_BANK_SIZE];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		if (offset < k3_efuse_bank_offsets[bank])
+			continue;
+
+		index = offset - k3_efuse_bank_offsets[bank];
+		if (index >= K3_EFUSE_BANK_SIZE || bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.dev = dev,
+		.name = dev_name(dev),
+		.id = NVMEM_DEVID_NONE,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.reg_read = k3_efuse_read,
+		.word_size = 1,
+		.stride = 1,
+		.size = K3_EFUSE_REG_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	struct resource *res;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
+	    res->start % sizeof(u32))
+		return dev_err_probe(dev, -EINVAL, "Invalid register window\n");
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to deassert reset\n");
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
+			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
+
+			put_unaligned_le32(val, efuse->data[bank] + i);
+		}
+	}
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM\n");
+
+	return 0;
+}
+
+static const struct of_device_id k3_efuse_of_match[] = {
+	{ .compatible = "spacemit,k3-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, k3_efuse_of_match);
+
+static struct platform_driver k3_efuse_driver = {
+	.probe = k3_efuse_probe,
+	.driver = {
+		.name = "spacemit-k3-efuse",
+		.of_match_table = k3_efuse_of_match,
+	},
+};
+module_platform_driver(k3_efuse_driver);
+
+MODULE_AUTHOR("Jiayu Du <duge1256@gmail.com>");
+MODULE_DESCRIPTION("SpacemiT K3 read-only eFuse driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

