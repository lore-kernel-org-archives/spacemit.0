Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A912C032C
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444191; cv=pass; b=VQtepDu7i412OAPfWnNd1cbPH4O8yzm5+zrKikKzzt8McSNR//gQSpzGcfUU/cBYrAECY9xOpH/+gzGPozQlTWG7mU1eGDgHV6kARe1FkNiI5ZQQjml2HRTMTvslMHgfT5C6Loyq++rRuBUnMs9Na27rlrR8bxIbjEKB4jNq4UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444191; c=relaxed/simple;
	bh=zkGnRbgCdywlE2nwWJjpaTONdfWD2+fa423VLntImYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6+xC84n/MoyxLCxxX5YXzulQ/z41fwUlEMlDeUUtOo1OroxeOmEt0Y+TlFP6DYdRGMf0Ag33i1gOEdGOu6hX9sQ8KwGJQhbgKWyF5dOSgSr4/aUPw1Xrp1ONv2uy3I0/FwOFN/5x3tjgJvYtPw13yiK4AUHNgeeRv7BvLjdj1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=J7IzUezS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="J7IzUezS"
ARC-Seal: i=1; a=rsa-sha256; t=1779444187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NEAlU+n6HtcKHaPRlS2cAOoT5YiSc3uHIvNlhdXROthGo19u8KyPWrbi1tTyVv3ndG6M5AgYaOgIIcgTk+zKE3xr0UewmR+kdP8UONI0CAk2X9qZ1Q0pZ/PKdCC8Cbou96iZQYlHuOcqmA4TYzYwFUIo9/aDFXzelgXEjRQy/rQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779444187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CYOxzoZuvfBifsCf4uAL4U46AoKqF5Z8ceyciuumBH8=; 
	b=NmoAEc8BY7b5VaxPMiltjRIPH4v2e+ju9G8Gk5WkonQONjQxmYM7wDR/l57/gsGa2itNWwa+xiedzdvZCWS37d5bbDRAFGHochQpw8aSMXMMObznGdh1LxTXAXj2nkYIz62R0Wy4ZyYRT6aA7UyFcKU6W/OYAIK7IOZKqSmUc9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779444187;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CYOxzoZuvfBifsCf4uAL4U46AoKqF5Z8ceyciuumBH8=;
	b=J7IzUezShDXhcw2azuHiEZzrGAhd8BUBrIYuBbsyInqLgWUgbAdZ3Q3sV4PHFFvZ
	H3Wu9g49D4wSNcZTQiTj7E0alFp/iazaEuLm4b0FIbfXz32mDDUQRIAGzep+LP1ehOC
	yyhasYm+Swxaq1gbMObhylM3Ph78RfKsXjlY5P4s=
Received: by mx.zohomail.com with SMTPS id 1779444184804298.6198250046622;
	Fri, 22 May 2026 03:03:04 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 22 May 2026 18:01:34 +0800
Subject: [PATCH 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
In-Reply-To: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444139; l=2207;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=zkGnRbgCdywlE2nwWJjpaTONdfWD2+fa423VLntImYA=;
 b=EAEtUXXVswunsrERQoedMSki48bc3bT/J7u477Hd3HP4SGRGlJ+BbO0fJmbbva0sBsss2e2gt
 uEcfstpWv36CTHuzCwr87SpTVwC2BC/TpV6B0laTCE3AOk5OVDqf4ra
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

The gmac_clk_ref signal is optional for the GMAC controller and is not
strictly required for all hardware designs. In several already
upstreamed K1 boards, this signal remains unconnected or the
corresponding resistor is marked as NC.

Furthermore, the pins for gmac0_clk_ref (GPIO 45) and gmac1_clk_ref
(GPIO 46) may be used as GPIOs for other functions even when the
Ethernet controller is active. Splitting these into independent groups
avoids pinmux conflicts and allows boards to use the reference clock
signal only when it is actually needed.

Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4e9a62d0e85b..8c57ca05dabd 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -27,8 +27,16 @@ gmac0-pins {
 				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
 				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
 				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
-				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
-				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
+				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
+		gmac0-clk-ref-pins {
+			pinmux = <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
 
 			bias-pull-up = <0>;
 			drive-strength = <21>;
@@ -51,8 +59,16 @@ gmac1-pins {
 				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
 				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
 				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
-				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
-				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
+				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+		};
+	};
+
+	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
+		gmac1-clk-ref-pins {
+			pinmux = <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
 
 			bias-pull-up = <0>;
 			drive-strength = <21>;

-- 
2.54.0

