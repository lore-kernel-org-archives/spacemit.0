Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF03D6CB4
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656813; cv=none; b=BY75APmyI+GWAn8RGUWzOQgOcAZ/2rVGsj1Wj92JbDYUeaiulK1JV+CifN6T74u27CcCq4X1rKXxkuW8iVlzRsqsD/cbNNHHwaWFc6ueqI+ALXiEPpMI/Lr+RaFmzixhKj2WDC+Dp7ntkuSvN9LhlAZ/+bOKnoPq81bA6a/6+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656813; c=relaxed/simple;
	bh=ExUGzDRkh5CNTth78Z2QLGpcnnEIRHjJhoWikXky/gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4v8E1081AUnKvIjNUTdVtfkfxamW/pp036WScZpXaUoFEG8Sr7QUUeGeYgQ9xh9uUBXG8GQpuCEm0HUsMuipk/F1iXsVu7K0MiWPP+qZN+1kEsxlqC35uFGt1SzdB1nVw0v3v0fM+DSxeekNwRL9c0fQHjygGhXFl47vubDZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CySst8xM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CySst8xM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d102471a4so63084125e9.2
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656808; x=1779261608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=CySst8xMe2rw83gRzfssFbZ6qotl5Ww/wieS9Z5txhlOeCUKaexkfAYYGOnvAZmEIe
         RQTJXNP2lenoXk+0DlrfPWlvL+hB3oAtOAeBhirDz+GEohAIQ28i4V7EXCLRHFSCyJsD
         e+8Ixl+IGCXf/DZE5BlFqlCUY6N5W72aQ7tEvfZmua/gE7puJyt7cO720MXHU8kUJppu
         Hw7vLArf/Ba9O8f/w4+4NACc39cTZv/28UJgBsP8C55zrlLEHgtnw5KVUEdVpdW3Fshv
         igvp4IvKROuCyXHnDGOm/NMzE+415VC0Z3o/DALqDYMmP6DDpkwtWl6726X5YSnW2vih
         vD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656808; x=1779261608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=Ml0m5+rqDRoqeySu+/mtDU3ptu0i42F8MZpPvhm+7REqIojDLqAS2Ex+SOjJE0Ma4C
         V7h6brQD2d4uZA5DVQw+cugjLvM1lh7iwbcafTFdgH80JGVYL/0KNKGwUS6z++7cpA7w
         okudslPm/z0zuOOzC6HJb9h/rNrK5TI0XKbcSdG054TA8cC7EaA9vcW8wRonXSZjYw2t
         q5TZBJZFq05WvC3Mt/CVCvgUetfBUqPZWOgyXhwEAryJcJlertjiLVZxK1ZIzRdeinR6
         suA/2nJ4LjI+lwKBMfmVFmk3f7mTQabJAs38qOlGiKQKcBP08wnyE6Re4fcIDwHHTSzU
         Ka8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4KdVFCnjibM9aQZnOTSJeFBKIyYRc1MfLptNLHJyqah99i6cn6ms2ImCu7IHmDw54Bp84i+QGKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOA+F8zRY8HQC+nevpTxDf3XJmG9R7UBoQhSMTNRikqcKGDtjC
	zMEKw5IIMASbSXRutjb3DmG79PYwk9A+FAIve1Z2eGzMunaj02TTR27V
X-Gm-Gg: Acq92OE/P6VlSiMxlSRZBYxpdcrSvk6E5yVeqd56vvz9BRhN3gkUk2wXCzDEWLvtgnH
	nFPoskATMu7102Nf16DYRQNmFeWeE56R3v31/EuiC3cpO+rT5rF/Pj5HQ7fhkEYNn090yeiE6k/
	UQlIDUSJ4npt6ermN13v52XnuyVEonuTHYiMWTBHceSShq4Xb9ZSyZA6H1s+NqemtnqCN+G3QWv
	3xscVms/Wlp/WTjPU1Da4WMJ8+ZLUH8j3yXMVvqlbE8kzGis6gTz1WsPVp2iCEpNCWgMzryu4gU
	eMcFtCywP6MWm1vCYg+PPexqwoECdux6lIRKAyJC5Cp8ABSNxKPM4VgmmXnzZLGEskGN38oSXgP
	4PXsy+mFYSAUJzAJb1X4SWJrYkLEtFJOh6ueMw8iO1mb+k8eBDzPZJLndIeQEYc24WQdvJtprcW
	tLDKrhvK2N+TwMloQ6WVHYDsOVEVT7ZLFKKKZXp20Ho7XaZ/nvytA++LqevJN2GQBLNQ==
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr29001935e9.28.1778656807922;
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Wed, 13 May 2026 09:19:53 +0200
Message-ID: <20260513071958.29574-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controllers along with their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b24b378b1b220..953c0ff6a0d34 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,14 @@ led1 {
 		};
 	};
 
+	reg_pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_vcc_4v0: regulator-vcc-4v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC4V0";
@@ -272,6 +280,36 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0

