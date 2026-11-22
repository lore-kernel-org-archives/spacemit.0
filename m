Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369135;
	b=HHKbyXKO8Sh8SpSKTj8471Sj6U1LblkPPhsDS5qFdZO76vgC0NErHi0VnRnLGlHe9spH
	 vAsVy3zUc5dqb/UQFOroxl1GoHDdB5iFYNAmJ0VseiLhQmLazSJko05Vo/l3yh9RRHlDW
	 bpUAVLolhjd/PudfVQq7EMKQV3r+vn79T8Ls4hwhE1+LjBy93CYE6s9/W9txhK1rI2tJN
	 ceRltewOqWKTUAEpUm9XX4p/UPM4/cASSKz3nWZ86DjvP24jbdkQ/L/wXcVpq0q+5YsZj
	 iCwfRoMroysIQFfbOBaIi8xi4vI5V9/A0KrwfYcHJgcN7vEngw3LM41KUs65QlZ3/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
	b=jvwjvrA6rXLEXeLFrCd6rRl5X79Bg3j++vVS/Rlzfl6FSc6W6mFtmxLs9jO7NG97jiSH
	 ky7w9yvPSReNDirM5RCDwuAH92+8WTFZ/xYj40q3GZMFcd9Y71CdrNOvUI3xqQxqeEk7o
	 K1LyjbtebGsd0tiJhsE2URt4atAJF1zAQsazHvm3Uw0cFpKN6qLhwfM8WVWvBe680zVe3
	 0iun/jQO1c/uAyU9GMB7+Skj5vD9r8FdSdv/emyRTRdUmYGodBCHz8YW7lnLpNR9yXAxM
	 eEYFZs5ny4da0LUa1esBZf6qp0V/9R0cN8+VcluXDfES+0ErEtG4HbcmdwCLU3BXeZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A1u358AX;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15940606A330
	for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 17:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15940606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A1u358AX
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3869b68caecso2896802eec.0
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369134; x=1795973934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=A1u358AXtlwvnYaebW13jBvc+R57KNh9zgQdGgjGU0WVQ85VLMqITrv4SNWVyuR2YF
         ZQkuDuxzu3bR0ab2F1RktVUwi5jcU3No5kDxsc6mdXqw2hlu/rN/WF0ggrpyap2Q2r6R
         eLgs/C/4VBOA/dmScF4OD8VnFyPDHf4c1wehCvAOopD7AhtSamGcPQ90LheKU/eqL6b5
         GfUeOCKHkptJd5wvnM/zG9ME/F7/3CCRdrmOCJ2REwYGNH9MY39Rm4sflchBqBt+GOX/
         NvwIhtGN+GU6b2BGy15kf70ygIxtAZXC7fgSdQxf8yyGd/+SWA+Vpon90ydoS1j1EioO
         v8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369134; x=1795973934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=G6SuectpUhSgEVAq4mewxPiUnT5tCZRo+eW1kMPOxYGfAol8lf1o2d8Dg36rxVB3iY
         RDRH771uFcfEc5Tsi0PvfN+GxVrmKiaVinZp4axescuBxDgml7R6Tp/7XMAhcULBQzhW
         jXKa9JwrZIkRxCOkuuyBoERXx3JjjucjtYobrN9XOTd+56zLUbGdqDjvG2lJQ1lpQLC8
         QNxXv8xGx/1zYzQu2oOodeNPnof9p54qp6iSPzjRNJ5OHCWtoXHRjWBegbtl4H812MCG
         8RpLy5q4bZ4dxvqIS5T8E0/13YHohlppR6LWSZLyAOGgItMDpUvPQEtiOGx8DbxzF8v8
         8jnA==
X-Forwarded-Encrypted: i=1; AL+hErEb92aAEeQdaHLTfSQ84683qAowaMGHwlEgml8YlyXbaDmqs9DGxslL4fYHV6t3QyilIOeouGv+Mw==@lists.linux.dev
X-Gm-Message-State: APuU4Z90ZMNmP+bIN88gtPS/E5/3lA2PvAsMM8/P1gmhyhIl/kot7a5b
	2PRUGOL8TzYYu2RK1kcF8iyJ64nY3nmxSCmZEW4L+tunCbmXL1hYchOC
X-Gm-Gg: AZFdTZcqWBLLl2Wj1XPY8rGeKr02zWbRG4Xjfhr4Tf2ZC4yJZx5v7I7xNlIkoktPscm
	4drItoz8pxx8S1gXF5/ng8uwbB0ojUzqplF7Dw/U2eNb0tgtwhK1YXdsT9VBh7p6v4cm/cyTsKN
	OUDWDSSHHFeWmCKwsFl9TQ8ALYw/Zecj7NSj363/upNYdZMw+0KH1aIpkpzmazFuJT+1dwv3YHm
	WihkCx3ny6p74CaQ0/9QqLx9vLLLQ7cs0SNKgE/4XKJ4yXiqxkNFO/ykADWkW81SjwFQ9N55cTC
	/l6r2bLRrwRitWVwG9C8vyUJ+bFHe14YhHSpRHBn3n9AcZ4LwV09UUiZYPUt35F0cCxp8Hdy1r6
	/UVhOypMlQla+8Yc440hDKeKLV7OJxYfUjH1k9KSSONdJwuFlsRr7LlFvSFU7/1P122w2qiQHmQ
	aV5deOa5x1fXDNqzhagMU9VvVPXIqBYPi3qpYhXy8bX9HDPDkmoGNVgWC85PPgT+4cpUEVIKaXp
	vXF7gw/HDqa2F2c2uv8ZTRfOw5MNi+EItytIxKCZ5maw+q7MC5Cq51ZqyslujFkRybXjtRHJR/B
	dF+jRqI4ak3JUP96gG5LJB3IlA6kohrtUFx024Gri+6xslcOUw==
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr451144eec.16.1795369133997;
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
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
Subject: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:09 +0800
Message-ID: <20261122173810.2409146-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Reload the shadows during probe and cache the data for subsequent reads.
Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
other banks.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  11 ++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)
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
index d2f5bb236663..4a8f975b35c7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,17 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. Programming the fuses is not supported.
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
index 000000000000..48e072602583
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/byteorder.h>
+
+#define K3_EFUSE_NR_BANKS		16
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_NVMEM_SIZE		(K3_EFUSE_NR_BANKS * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_BANK7_OFFSET		(7 * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_CONFIG			0x004
+#define K3_EFUSE_SOFTWARE_RESET		BIT(22)
+#define K3_EFUSE_BANK0_REG		0x104
+#define K3_EFUSE_STATUS			0x184
+#define K3_EFUSE_READY			BIT(1)
+#define K3_EFUSE_BANK7_REG		0x190
+#define K3_EFUSE_RELOAD_PULSE_US	1
+#define K3_EFUSE_POLL_INTERVAL_US	1
+#define K3_EFUSE_POLL_TIMEOUT_US	10000
+
+static const struct {
+	unsigned int reg;
+	unsigned int offset;
+} k3_efuse_banks[] = {
+	{
+		.reg = K3_EFUSE_BANK0_REG,
+		.offset = 0,
+	}, {
+		.reg = K3_EFUSE_BANK7_REG,
+		.offset = K3_EFUSE_BANK7_OFFSET,
+	},
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_NVMEM_SIZE,
+	},
+};
+
+struct k3_efuse {
+	__le32 data[ARRAY_SIZE(k3_efuse_banks)][K3_EFUSE_BANK_SIZE / sizeof(u32)];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		if (offset < k3_efuse_banks[bank].offset)
+			continue;
+
+		index = offset - k3_efuse_banks[bank].offset;
+		if (index >= K3_EFUSE_BANK_SIZE ||
+		    bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, (u8 *)efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_reload_shadows(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val | K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+	readl(base + K3_EFUSE_CONFIG);
+	udelay(K3_EFUSE_RELOAD_PULSE_US);
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val & ~K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+
+	return readl_poll_timeout(base + K3_EFUSE_STATUS, val,
+				  val & K3_EFUSE_READY,
+				  K3_EFUSE_POLL_INTERVAL_US,
+				  K3_EFUSE_POLL_TIMEOUT_US);
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
+		.size = K3_EFUSE_NVMEM_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get clock\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = dev_err_probe(dev, PTR_ERR(reset),
+				    "Failed to get and deassert reset\n");
+		goto disable_clk;
+	}
+
+	ret = k3_efuse_reload_shadows(base);
+	if (ret) {
+		dev_err_probe(dev, ret, "Timed out waiting for shadow reload\n");
+		goto disable_clk;
+	}
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		for (i = 0; i < ARRAY_SIZE(efuse->data[bank]); i++) {
+			u32 val = readl(base + k3_efuse_banks[bank].reg +
+					i * sizeof(u32));
+
+			efuse->data[bank][i] = cpu_to_le32(val);
+		}
+	}
+
+	clk_disable_unprepare(clk);
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "Failed to register NVMEM\n");
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(clk);
+	return ret;
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

