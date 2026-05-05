Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76748B381
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997196; cv=none; b=NvOYE3J26QG3Cofhx7SW6GE1uht6Cg63SZ27cVIMKVHqYH2v4yGJWfPUdyFuQlp+ofuK8Z7f1/3pAMOmzDyOEeeLEcqpZjakPYrv+UEFvb+0eRf/rYxpdxgP26zsNVpreGEOKLiTjQU9f0PJjUUO0mEZayW25AMvNeWPqgi8gaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997196; c=relaxed/simple;
	bh=yLrMEgg4xUBImfWNRLDWNHWRHZxsFqAJv4OtvTgaMXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrxlO8xnmv9MBBh+tzgINIcam4wkUdFHcnmuEdc2qNzCLCLao5RfYjHRGxpWWBsRXM6f/19DbGyFj0U1Xd8nxdpXEV/JHkDpegLs81BmJrh358heMAvu9upTc6Tchaeu/QljDSOpk13fa8icCRChmIhiry/PA53TaI0NuYHuYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqxS1O2J; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqxS1O2J"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso41782115e9.0
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997193; x=1778601993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=cqxS1O2J3dm4lsTVNbLHGKYrnhCFS28gBdIEcLP85/RS8dy4BvqyLzMRDIziUu0E94
         wEJJIhlpIvbr4+rkIiAOEGQeYmDOIN9ZNQiH9KkISlVDoOmicUfxeVlH+mYbCGWUWUOR
         1h0XhcwNrpNaw8DfWPnyfJsujiCVT9oxhJRzAh6GlDCt0GQKkH4nZeXYV5RdsM6+B2ab
         c7I6bL9gN8T92eIm5cOHMqxA3JGzNrXCcALZh2HYdzYsDdB8gpCWUva4qVVh6HF5Umjq
         beSWs2nwFZtlTt9tRYKszV3UXTgRRxIkf82k3GtZhL8bEWILGANBTptHrxq9fZWt8mbz
         ZYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997193; x=1778601993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=F56X+CX7EZ3tYuGSsj8kvEqJmgSF6wVifXWBJelYQnhLX4Ik8Fn42NHjHUoQe2KBHW
         4IrDhZn0CgzE9TBwVNxRZ0j8sas0M2qhQjWxI1oeuJiX0iFSTcwxIiUKOPY2U91cQ0D4
         mIT8S8YiV5UhlUa6EhZqznAONq6tLPszXpnfcwotiwVgPyrsMWjBceMdSP6Vxcl2dmx7
         TQ570OxWiAlEAe1CDhReHda9yjFccdPtSAY5ur1P9UEdiD5dfKg6CUub8fl70yOdiRjs
         LJ+Lzw48qmt6DovNPFFq+tkHsjqknOYfCcWHS7pt89w8VnUxVUseknmK183F2w/dwAxz
         qztA==
X-Forwarded-Encrypted: i=1; AFNElJ/7sVTgfa8mqCnAkHEbpRsUfbpEFIG2iUuHuwX5NmaQhRwC9Te/wO5qYHwuj1uE70NZ460tbPomIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmnGZ9YW/0D0/i06hX5LXOe23sOfeHilcQJsYrA5HuEkWcAT6v
	0g/QADm2dTfWCcK22zpq7W15Td/i5eUwpSqbRC0mn0s36UymLsu2YObf
X-Gm-Gg: AeBDieumJZU8PXimqKkybW+icMmrQ0LHcqS6bOXqaQh9usHSwVanp3k3XDqpQDEO3Sv
	VX5xFLiEE92FRaENyJnkvzS92lwLzsyRQ+CorlRPgoiI6xKvDtBkcyPV+yHNNGeovNT8AH/GH/Q
	zxmua3+r/Est3c6jVFDbaegloSgqD2I6zG4pX2bnKy0/gsdlaND42qvvtm90VJBWoTQ64c/4ZkM
	HGgxv/j2ZTOILpHz1fbIbTpUERXVtl8kueiCozianj1E7u1P+2J2+agIJadRnNKPHiGoA0UoOQh
	jZkEv6Vl008gzYkFXTtUq1VgkdW3KCbAB3/LP49fdwq8oewz+6FxZQOT2tHhHFp5mnMofeNeqzF
	UKxzMtDQlSAN/TdtVOCFLagagt9Ji4IF14+tSlXXXWRoIImBhyPWuXtaEO4fQlZUO2VRfXZnu0b
	qfGTHylNhAWyLMj1qtvIa2oVJXSChgPFJo7Qcvk61bS+I18pCoz6zHYOnDX0I1kxpoQ2Dg0ndU1
	X54kScb0mDeKSx/lQ==
X-Received: by 2002:a05:600c:83c3:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48a986713e7mr250556915e9.26.1777997192411;
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Tue,  5 May 2026 18:06:19 +0200
Message-ID: <20260505160623.1369347-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 869172d23e259..3ba6244952b63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
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
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
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
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0

