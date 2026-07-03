Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E7242D72
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044044; cv=none; b=qSI3bg1l6jxPwkG/rFea0wVaPsiiCRrMF2kALtt2+itrIFyC0i/mW0l1XoqB488KLJ6gBg2vLNSa1kuoAY98iUsUfhUFsb3MRW/XnfnlVitYerLmuCfau70oaRBlv30S2Tn8L8Bu/FkqcocJVuzGMuostFAEtNfNOroSmirbi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044044; c=relaxed/simple;
	bh=04yEbrBAj5g/Fp2zUPgpONY8/+NGEPJo0vMYeCOwxNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWYA1rSVB24MEK6lVXqgcsrLt0Fae6OEkSbsM1dLlmxItRb9un0oJ1dTPR/H08ekowV2EEv+gaIIlP++wVQnX8dMLBFuoCpIMPpvMuwLQHEr9KuYB7OXD31yBPQvGB7/l8csjQ3Jy2Rl8avqkiWqREFZwsymH7cvL0wX2FSctc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9g3+Lg6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9g3+Lg6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381216921aaso64321a91.1
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044042; x=1783648842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=n9g3+Lg6lYxR11VJFTdrvvDI2xbVTyGeOaCcMofLgmz41IVSdiQ6whEFKc8eMmngsB
         k+IKsY3SB6L74rm7DiXb3ab2giGJi87pbpYbxVjHqYHqcJ0fqEe2nSMBXwyW+5X12zEX
         shd2hh2qnBZqEyF3JzFigInKyPKtuLwnuphFS4cylbOhN75chMzJ7pGUOSzym/+8IyO8
         k3QTosSo18/9Pa31YDfmxadYG3IGv3Acq51c4dr5RK0mhZiE5CsfNjpuIQFaFrad2kfo
         iDmjL8ho8BHe57EtkfDD1oydP5k5yNcjZ/eja0wL4tZBFREU9PPyC1U9918oYckzgiUN
         oYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044042; x=1783648842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=mwSRnkOtVqJc0WFWBr8mEPkqZtg/c6leXDqy2ua3cHg0vuc9eFhK2Ywklj9UgrbjCx
         NKsMsdliJOenRD+vKjKToNHIFDvHgYOOnb3dQEdD6xpV0CdF7bvfVXwR9DUBLyxY1wHZ
         KB0fAxqm7Ke3PPetg+2Qh62R8TnrJhzpRXN7cH2xKncVhR4uvbCF69AhYmdLLCH6EiV7
         aqnawfCcPyXNTaKni5wPXbaIW6MI5zzdKQA4m5oPVJvYNErHSXBpV/145rCqTdRrc2nC
         2Dk6eFmE2syQNeEBj0f8Z5esmdYqFoVwCAoHfv8Kq5jnGHhzU6RoCVgQVaG7a2U9IM0W
         jrXA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv78pf9GZhJF6KuxKgbzEhyH+oMeiONB3/MU10JwmWYC1PEiVCZ+nWioKSskg0YXYC13BG8hlrrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPln5PCxsZ6eyjNLy3SntejYCnEZ3drVcpNFzSNjclsnxPeeHp
	vBdPqJYpCFLEu5a80yYBtaQvV7M6atjhGS8M2ybPYhE2JG2PPcZTrePC
X-Gm-Gg: AfdE7cn2psbJoj8cZicHz/gVJ7+QbExK2DAiWRqPeRvyOQg4QVLiCSrVjfEFkkSSDRk
	//OJx6wJIUwWHU6Z3jggxgJxqPMQz6ube9U/jNw+SdGdYqkqfyJ10j4iSWAoSx4Uahcba9+lNB5
	1H6lUuAu9qk84nL6dDxnGW5IestPFI3ZsUJKtb+9lbOGuUthxAcnN6yvd0EvwPgFOIko69025zb
	oHyvFWENRSnU/gbkPqKWoWicUc/yM58BijO7YAYGPGxvXqY0RWM5p3p8NtJCquAc0NJhWfxVJcZ
	9H9nLp3R+0mtL+GWCpcTt1BmDCqfJGXWIM/OYKXX/zZAnl3YMpr3w0No6ZIy3vNM+skm7pxlzuO
	reMCI6t7a45H4q0NI1yLhaaBHLjLd/P0YACz2ssLS0r5jV+sITK+SjB95cyjIQcSD4wHbam5E8w
	E9IrOCIaJlXxc=
X-Received: by 2002:a17:90b:2c87:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-380aa0e0512mr8521066a91.14.1783044041818;
        Thu, 02 Jul 2026 19:00:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c12792sm190602a91.5.2026.07.02.19.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:41 -0700 (PDT)
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/6] PCI: spacemit-k1: Add device data support
Date: Fri,  3 Jul 2026 09:59:57 +0800
Message-ID: <20260703020003.485436-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..f6ae8ff3589a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -49,8 +49,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -278,14 +287,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -299,11 +315,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -320,7 +336,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -338,8 +354,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
 	{ }
 };
 
-- 
2.55.0

