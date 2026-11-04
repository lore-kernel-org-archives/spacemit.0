Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801371;
	b=I+1GwyJDxTa/XtlMiOvrjXEKzXdbZWCzrqToZUjSWrWH+Q5zS3KI2ieqNo1IL/Bg9sAq
	 /1VaJ2zHSp7NmTD42PFXjaOiSbQbU5BdNyOdsQeXvrhEWExdeIEmewlX3rLg5+cL0sUdr
	 bLelFejLGEoR6DRGLZK1gD98UO+RCSpYR1s53Yrvl11/sFuOLhqo2acMKJexqAxkfF2bo
	 CT77eyghv2NfsjlYcB8ihNNQSr5Fmgnjm0DpK/duPo+OhisPhmjGTdpBD+cpZ8tjsB5Hf
	 5DyPRw8qZ4vB1yf+sFLgAI3ZdnY+JvT23O3oYxrdTAwkHqOXi+MFjj8n+tlma5+vdFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
	b=euWjWiIu3zZhqqqxSY3odfbpIchN3EwynmTTCdNuGa6p4j7ZyXvl3jVwnaZkLHvp1gXF
	 3WOUpXd4EnLDsOsT1e8jBRxEJcXL/xBg3aYcmEbHLXha6hOuBHPgZpDchK6PAjqcMMGEW
	 IgOsE/Jg8ja4o5O0cMyNpKX4fLX0RojYAB9RLfXwDTyF03EqnlegJE2Qy5YpLeyWgDsCu
	 FcxD8vUigdXM5jXaLQ2VKwwVdxzVBqJYjILqagcnAEUAZ4NPW3oI4HJUtU/5OghYUHmtT
	 g6kbVcCrUHk/BJKsqqVoyu+YDS6sl/8hmOqWWdjUULnBbiLk4Zx1uxm50QKY6JmEMPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhWlwctQ;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A2606A329
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 14:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhWlwctQ
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so3093885e9.1
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801369; x=1794406169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=bhWlwctQ706ZrG84o7OWPIRvBFKCJjDUEGapHu5Q4wSNr7JfLHehTNXTxb/IN8hssV
         KBz8T5oV8VXOnBJuxJIzpBpHngvr5kY0Po8eAeZ6UB4JjM8NLH/EdLodkUU+5B9GC+mn
         iW8BrBjGWJlkW+ER6VieouQUiQf3PEz4rXEMOtfIZObFPNeLf0jBBmVjFsKohC81wb/v
         nS8VThUigb3ap6UU33mxET06u2YO7CV7ST39FV07ckiPHeR8eJYXl4f68ZSurUvboVx4
         VyeLzSQDTpFwjMYENq4HQ8pSTjjG1AsQcgnp1RULsxW/ZU0lND/t+2dnBpzp0Xooo1Wh
         ZUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801369; x=1794406169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=RnCOIhHQL/UN3Fpjl1pTsdlfv3MLlHxiXuZrQmHe04f2zD9LJV0Cj9PzijlwT6Hw9K
         maXRD1sPNi4CtwHCPSpqJenZAZBjy0686G7bLC8Re8OkscSlCJ1HZJw+gxgqN5XH4nCu
         4+fakwiMYEN6yMLJG7y0A6cfc8V6EHg6IdfRmaF7foFjNUGx8Ep9DxCK46zu/rm/fwWh
         pwn8JEOwPTedljCzbTYGGsS2fotBqvacj2rsKCGODX4vHZ9uIlAP/brVHVcR3Q0R1g9K
         hLcXNz/3B+TKIsfaqr8G1wAKa+9Wo5PUBS2T034gMWRcdZfGfrb3HfP1kc1LwBc9wOt0
         xHmA==
X-Forwarded-Encrypted: i=1; AKwUvBysYJMiK6aXlr/0ISsjDfIq8Oula0t676F8XzVPO4cBfTorO6GUiiKc686XuyAvty0k9lZD8LewmA==@lists.linux.dev
X-Gm-Message-State: APuU4Z90xx5PGKtMi/QixdoQyJrpC2AKWY6X1zB0PsEWJVnHovKEUwyS
	vBKeMAT04I5dnTJFMyr1r6wbzL5Hec36XnvkIqBJBMKyUYOayzqNQVfq
X-Gm-Gg: AYBFou1wRTA8v5lPNho4EjjmDLGYbNrjGEoQT1A1M5Xb2tB8FyEBbCcXWmCpJxizlqt
	GLLJOR/Il+6lgmYIG7KWQTUWv1J9jtnRe7nh5Y11YQc3ZYmMUnTwL7fWu6zdE8v8q8ML8mY6dpj
	xoAAStrw8vnV4b7A8wfn34eQKZHuFXZVM9mUyevlGAKTUJDUaf3LpqGXmV9UQg0VnkmC1iIohSD
	Y36f3/tOidSepPL2fYVE4oqMPOAGT+5WxyA3WU02jabn9H2QuSoQ5ueid3wugpv/Dh1JZ8IUzDW
	YnrTvSOi4wch8xnpsBTQnYXUAseK6ejOn4tNVlwzQ8ovnGRIQPuG5LHoM9lAuO/+++BI863iCir
	AZN1vdjiLVeQNyIkzHfrZ2EzOt22xaQwhGmwszX2+EHum72r/fieS9uaH7LDpDtL5G9WlWwT++U
	Oz/uKS8oa9Qp/VUSwN+No3uafplsjXj5w3VQxRpeRy0NiJtqBg+w59fMHFmOwXP2uBz6auZ5YMd
	d/gFG6IoOmg8DPeWdNQ27Z6ten0/giMqdzSKkASHUABojqzSIkY2/VPflncgZLZY1WVZbXaWHAg
	XyeqEWekzEzUzwa9egvfLmS0A/AQzD9sY3OhMsvHnTTGZCIpNHLo2g==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr177944795e9.29.1793801368473;
        Wed, 04 Nov 2026 06:09:28 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm40977605e9.0.2026.11.04.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:09:27 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-pci@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Alex Elder <elder@riscstar.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
Date: Wed,  4 Nov 2026 19:07:45 +0500
Message-Id: <20261104140750.761330-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
control logic register, which causes controller to reset itself once
PERST# signal is asserted even when acting as host.
On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
runs again, its first DBI access hangs the CPU.

Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
in k1_pcie_init() before enabling resources so controllers
dont end up resetting themselves when PERST# signal is asserted.

Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Hang log: https://kernelci.cloud-v.co/scheduler/job/420
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..af6028e8825a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -47,6 +47,7 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -131,11 +132,19 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
 	u32 reset_ctrl;
+	u32 ctrl_logic;
 	u32 val;
 	int ret;
 
 	k1_pcie_toggle_soft_reset(k1);
 
+	/*
+	 * Ignore the PERST# signal so the controller does not reset
+	 * itself when it pulls PERST# low.
+	 */
+	ctrl_logic = k1->pmu_off + PCIE_CONTROL_LOGIC;
+	regmap_set_bits(k1->pmu, ctrl_logic, PCIE_IGNORE_PERSTN);
+
 	ret = k1_pcie_enable_resources(k1);
 	if (ret)
 		return ret;
-- 
2.34.1

