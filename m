Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F65038F8
	for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637586; cv=none; b=KXMxwcqX66wdXBQ5Uv6qRgH39wNE1iGKi3tmm6QH5HdslUFiD3oCGnKe0GIlgWJ78PXstRyuKiqkFbTA42ywIAWMH9yklnVzcvmVmnaOTP0uIeTJpI3gaYGZGjTIY7i/klDGT+fYKoBYMfY2pGFysA7qomp48lcx7/DwRGSm97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637586; c=relaxed/simple;
	bh=2xYNsERr512t8YcP5rQXVu/seYpQuw0f4hBvDUPrnZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UI+0yiBUHWTivA7zcRN0jbNTr6vu/qQWBdwhjqvPCGvDu8vJRM82LormdIEKAGXI02U9EWEd3mF3DTyAsmX+I1WsGbHuOaI8aC1yHAKzvO0NN8mzLsU92kHn8x6qRvxiwUHZi67YlvHUVvd9XY0MHbo4+CEU7sYzSwOx53LOzas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ajuka/sS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ajuka/sS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
	b=Ajuka/sSb09giDVHFllI2evwHf9CdmK7cZC2/2ldhQo6ssnbR3eEX9FpGRNkG7ueKm5x07
	NwRn1Zx/WQxXd/+r1JR27Df1p0CMZmVM223u0xAEcWWlIN8dNAKjj+i2kgnfrS1ArrZPoR
	W/kmvz+gHg2gmVLLnjC9tlh/KBi5cqY=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-PTcw1-2ZNB2CDi16frlGRw-1; Mon, 28 Sep 2026 19:19:40 -0400
X-MC-Unique: PTcw1-2ZNB2CDi16frlGRw-1
X-Mimecast-MFC-AGG-ID: PTcw1-2ZNB2CDi16frlGRw_1790637579
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-671321441d1so5057230d50.1
        for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637579; x=1791242379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
        b=zRpgJFauTjZtMRDayyqEFORumRoxZTTbwg7N/ezz8tgFxbNfBni/vq72OAjSsfPW9a
         4SeNFRSdnPGupOleKWwb2kVyS5W21CLLeKj4VRJRnfhnfv2Wgs2OVS+pI87w0VRhK5Le
         4yL8GrocRysVOLFrsVPL/MwnzYsepQ+PEhZQTXN3ScNIuoDJ3/dCBocYWuI3/u+VocxA
         5JMUFq7rUrPuvnFj95WMrcmk12fcFGSo9Fk4/nY1G9vuSdV3uKqw9voyQEdulk7Gtfoa
         DqViC7APdlqWF0Szaj0rptYND9/azj1iZWaaBLmDIueKr+jSgLWVBklI8whnJFY4TFKC
         67bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPbYDqGyELKDSq9LpbeW+bnu4QdorLUfBjTcVc77NuVEjnCO3c1TVMsCk5pIvXhMe9foaglw6PiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkq0qOYXLfTTtbwYLofTMON7SxCOfwvAm0o0mofVAZpg7CH9WC
	2rlf1NnwbE7n7DW6PTnZaS8i4e2SwACbWZKDSImLDmfZasuoJM98eivjAmkWC7ET0v1Nxt5v+hm
	6bUmGOwvZvMoNEi0KbB4sWKmLuVTA9+Qnx3KzI7VAAwLcCik1r2uAex7cbNbj
X-Gm-Gg: AYBFou3n+i/WjZHJdzLqkIHtHH1sM1k4JQStCSfGrhoMkiPDXPbISBkav0DTeJwomte
	T+E4ihuLvbQmzuTyCxepdOwqiDbnQVJ2eHtWAt/CVXNbubkHwuUVzAB/iWHvDNuPK/YfTskgJ40
	H6jzReOMmoUJAmTwlz4taYqrAxtjSCRbeqrVpRPnf+mulyaFbzRmnspZThUrf7ax/sLGnBwVEyZ
	C1uj1Gzir3bPeBDLy7uRzAxeItcH0HiZRT9Z4wwfGRyXy+/xA5B43WwnqVK5U1bsTm4vn17zZwT
	X8VQg913e7GNO3iyDMIad0H5jV1SWQ0Tm18eLTy8HtBbNA+xagbn7A==
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783193d50.50.1790637579502;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783181d50.50.1790637579018;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 3/4] riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
Date: Mon, 28 Sep 2026 19:18:06 -0400
Message-ID: <20260928231807.1757995-4-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -5ynglWPuoyN0YnRQzrvcaVZXSaRtr8UIHBSdcQCtPs_1790637579
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

K3 CoM260 Dev Kit uses PCIe for three M.2 slots:

- M.2 M-key 2280: PCIe 3.0 x4 (pcie0_rc)
- M.2 M-key 2230: PCIe 3.0 x1+1 (pcie3_rc)
- M.2 E-key 2230: PCIe 3.0 x1 (pcie4_rc)

The M.2 M-key 2230 slot is connected to two PCIe lanes, with lane 0
on combo phy 4 and lane 1 on combo phy 3. The K3 combo phy cannot be
configured to use these as one PCIe 3.0 x2 device; treat this slot as x1
only instead.

The E-key slot has an RTL8852BE WiFi+BT NIC installed from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 45 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 33 ++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a4dfa25c837fe..01e286cb05797 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -39,6 +39,14 @@ reg_vbus_5v: regulator-usb3-vbus-5v {
 		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &combophy {
@@ -61,6 +69,43 @@ eeprom@50 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_1_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie3_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 4 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_1_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &usb2_host {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 1b19979f150ce..36f7780860f50 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -800,6 +800,17 @@ pcie0-0-pins {
 		};
 	};
 
+	pcie0_1_cfg: pcie0-1-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie2_0_cfg: pcie2-0-cfg {
 		pcie2-0-pins {
 			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
@@ -810,6 +821,17 @@ pcie2-0-pins {
 		};
 	};
 
+	pcie3_0_cfg: pcie3-0-cfg {
+		pcie3-0-pins {
+			pinmux = <K3_PADCONF(3, 4)>,	/* pcie3 perst */
+				 <K3_PADCONF(5, 4)>;	/* pcie3 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie4_0_cfg: pcie4-0-cfg {
 		pcie4-0-pins {
 			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
@@ -821,4 +843,15 @@ pcie4-0-pins {
 			power-source = <1800>;
 		};
 	};
+
+	pcie4_1_cfg: pcie4-1-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
 };
-- 
2.55.0

