Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580143;
	b=jkCO2901PsmGY4XxAKYCyyzGP4QuU5jHmMrTaIA9okXFI8BioF2pXcIxFszB3VtTv0OL
	 Rh7jOOZ6SrtycUfWBtzykfRvKll32g8zMWcXS8qLlRBeKiAkvQ04AuxKfsr14TEQhMMn4
	 +vtisUEc+uPZexRwXzDxEHrpKSMNSxq7KRWatUxFE762z8jJF0XR29EfYZOOaS/FUc/AE
	 AWDvP1NhVGC6hghJvuPBAZyD9sZxFcS1BIBvbfT8PJRQizysHE0sVV/XKxpTnWb+NtwmG
	 euRkRGmeF/PXaktzKI74fxeRGiUJrl4GoahoI29qCDryZhlTglFDBXo76jcZgouwD7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
	b=vijFZWWqwWObChakUxA8XW1qh5BbNdIa1rTHavOXaVERZnebQAAXwindLk/AYQaVriqi
	 toTdZNZsgwryo0LYMqjgfGohpSV1HWaaBwwk2+8WAMhhjJA8zemh0h6JSEQcqkC/iQUpD
	 kHnh0CiT+p5YT5LO14F2HlVntgS1+lHADyr9O8/140jKH2aSHg9ygrw3uZo6vJ/R/bNfV
	 cRX13r0Bc3dqLYWm6+o15REZpLgJOSWCZugCU4uez46+ISxQkzUKSmTs5nhExBH6pBa3o
	 aN/bhYrQ7UOZkPczXcl9n/Cr+oU/23fDmuYhztIwNALmRx0f7CydOYVWovfZGshD38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekvS7Yhd;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDB606A32A
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DDB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ekvS7Yhd
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3082913a91.1
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580143; x=1796184943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=ekvS7Yhd83Z3f8qlkaHgctq6J3jgamU1M26RqstrYTZ/rvsDP5U09H2BbK5t5nAyzz
         UwHR8BututYjMfMm4HhCEzJiv/bkghtEg0iyKdT3pCPnOA873tQdZIWDG90tDmidRygr
         0SOUurvTsUuA55xNqKHulfRry4YtrhatUl08FGYj43zi0yqHpirBQ9cdYAb+I89dBx7P
         hbO1W373YIXsUWM5x98OUVbOVxBSF1awHXuD9umyjw+icUVlcqy8vM8sgUAXIVpioBjZ
         pb0goY2HJGww8J2L+nOU0/ofTosLUk2+92qAIjU712tLxr2rbfKIng9MQIcQj2/fintm
         Wtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580143; x=1796184943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=v05uRV4ZeVgScwTKvfDhwiuTm6tPuiN2/7tKU4t8rrtP317d8W8IUMjhRzRSrt2LSS
         UYgk+x/f+TjFKVElLqJqiAfLw5vy2SMih1Ee1aysbtcf1kFTxE2XBkJhiFTAKXe6AGV3
         7/pvUYO+Ptmynk5/kCr+9wCbenRty9htqIqaSbOghz0WMIfXK5J8HMtXfPpM+XNQ5Pfy
         oJP4SNPbi8DwHVJMdTgZ9IijckbnQwPyUm1IMFeJC1H6zjCVvUMwvDayp7MM5I3k/y9O
         E/9CznGGSKdswZKBoH3Q0A4KXWUsBoj2MG1jEe3Yt+jAbIcnOKM6E97J5wQ60LaenegA
         5/3A==
X-Forwarded-Encrypted: i=1; AL+hErFv62L0bNTeAhbvGeM/0TjJUoEiTcqHFli2P7x06uIH3EwkCmqNyO7l/E0x78yh7Q+9Ez8fa8Dw5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9P7j9nGNDLh1e1d9ClAez34lTspoq5uR5oa1OYH6+15PE7x2mG
	sUGGtVciwTrrI4uOFO7rxOMZdoxct7l9HHxH01+1DK9Cpmn6xoi44knW
X-Gm-Gg: AZFdTZeEczJbxaJPE0+IRnQKvCK/BBBZxKZXpRqrRNNfjoy49KB9MUqBkIDLoZ8y9V7
	0mraglq/p1wd3jlgXOijW6+UEnJKiAb+kHWIKXbBU1SGpuO0rBl/MeG5KwHZ4L4zTQNVy5t5ghG
	Lf0WxHcusU+TDnTrMwLC0ULnHubkEMF6ZQjUqImHhjhHE3zA1L/zToNjh7xuzBKKtMvrkeAPNCc
	Jz2ok+AXaM7GIGGBOz3td+SVP4V+joCIT7bo4tAI43YTyGgVSEzL9h760vSNG4UN3EGRneABdaP
	hgpqtbZvngXM1+yLloTnC0r1K6p2vzBQF/SUWr/luQUHy4hzFbFfr7TP4lDoFVznwv01KcKCvci
	7ppvU4Ug3y4Wphc4jomNsHkggdVfNDcuWttG3uhnyMzNjwn7ZIS1UT2PEGaECreNDkGh2Q3gZPH
	hQTpdZBQjPbVYnCgNz6Gje4w7OQa3OsNhJjwBx0IV4K5GY5IKxJF8zjS5ju1/8aAaVKD/EvBQ4/
	NWhe9Pm2UK1FockPRvyU+DDxH/1DXsQzPM0wtQqQRNq1Ktfv/8r8D/WCOKG1dB6RjUuutwrurNi
	WiP29Vvvgq/TBghlSzCmmacbRD1Cf34gX0cGO8KUjVCYKWeb
X-Received: by 2002:a17:90b:3b8f:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b41c95f0e1mr11207523a91.34.1795580142737;
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm27848549a91.13.2026.11.24.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 25 Nov 2026 12:15:17 +0800
Message-ID: <20261125041523.242588-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8a3cae32609f..f20c74eca73e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -55,6 +55,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -156,6 +157,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -171,10 +182,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -384,6 +392,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1

