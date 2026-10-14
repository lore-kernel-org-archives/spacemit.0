Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C14B1CF4
	for <spacemit@lists.linux.dev>; Wed, 14 Oct 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966102; cv=none; b=FHlzW4PaNb1/ooPDYTf9MEVCXjydha6GmjqyZ/rIYvzO60bnI0yKZC5qLAQvdML4CaybM+5dcVnOV4L4lCG9Gh9KON2mF6VBwBd51M4pZjWtnx6nHjhGZH23rQJy2xaoqOwHDF6C9klO/qvtfqwVZsV+/X1vSjo5rI4NrBRefc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966102; c=relaxed/simple;
	bh=1VX4rN7/mTu9mQGkDzrp56qGEl5UnWa6EMbBEoMhjec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyrjxPE10fkUgTTfhVVhv3WEHNsSir/I6tKrm/XxXkugglgSCh7NgwPHzmceT/burXyDde8ua7Nx+Qb0ALWJucEjaNFEgSTp36By703H2qbRBHQ1ADu/K9D0JQL4ad2q+U3gZiO6vHH7G4WVD5q/L3PDL2KAzrbi1mAt41bbAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gylpk1pJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gylpk1pJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd3310348d2so2719072a12.1
        for <spacemit@lists.linux.dev>; Wed, 14 Oct 2026 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966101; x=1792570901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=Gylpk1pJAVgbgyiGpnLaVCYIxWbpXYVOqiTf0CvOLpDor32B/zA8D9FH+yqZTjVfp8
         0qgWC9XpR2EW/mJg5lm3k0SZzt5lXRhZYIIdnhVeD185lTTG6no0giLe654ESAtbPYto
         goKsOXt4Dr5tV/WzY1WG7nJMYFACvTEdYESI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966101; x=1792570901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=R1XGv4Uwrif1l4ZRbrYZboGd/C90c+K0WQmuEfTJhGc7r2Pij7JoEm0m2+ro0Bx+AH
         JdgJ8QVha5ELT1BfmXSFqDk4M3/CWwK0bOPt3sdASqRCb7St8ExmquShYWasCo4P3S/L
         /xOPQwdTvam6qtKPgXQmmp2X1XD7g2pt/iWq4g118MZKis84BYZop0grB6QBeHqdHUdb
         JW3Cfv/PRyS6r8JNI1I7Q30GYL4TPIoXvDqyyT5iqHJV1+wokYeg5oZoXTVRXxx0VHO8
         6aQq4RaEaFjmvxYBRDQFYNiuwOkrBPUUeIRR9/4Ktmptl+AAqF4/a8IwiZRFDpRls8y7
         /Uag==
X-Forwarded-Encrypted: i=1; AKwUvBxT1n19XvQ5ZTU6HKz8xGcZxfxCDe7Xsn37fQHhp4kHvBZ8xQLLqGTr1nZV/FtB9NEA2kQz8ItNdw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKA5mknTNJETNt89JJrnxtE0BJjZmWiBYvXi9oEcP895hQmCPKH
	sW4vA5HlT1bz4ecy2w7aXgvdlhZIHf14GlJvjSsjT0VIPL3xzLn1N00GY9nATBicSQ==
X-Gm-Gg: AYBFou3AK7gorASOG9JdbLQD+voBPaTl2lhSsCYzDhgGhUsAZ1jAy2aucQM59Q4YbYe
	23Sc1gvmBEprryOZnBvX7WQK/VCUsmtmaH3pU595E0cMSZo4BGpt8s0pHUbPbnHytAMeXMkRos2
	eeh9EOEA4pUeQVYGvRBC9WC6cj1MaaBJEFtRA6vCLkz8mFzPy+gJMjMACuI8dw3/ZrsBQdC4h9A
	7uvz5xARMpHl5F3CqjKk+pJFKtzcG6X+EjIdDLkGrySzP5ZVkxYkdhf81vtZhdg4oviOSgusjj5
	Wc4H3WCFxnvRk0zEc3KyQaNK7OLb+yxaK0XUP803ddXkepQyd2F2WbWel2JBFDbjj1ZNO4kN1et
	1M2bhE+mL+lLwMdrBuHZZgafJUmFqczffQX7u+OEzigOqUfiqlx99SSXBLnILDKauKQWSkBbMQv
	K6I6y0q8ACyL6qljHUZqdJkMrRcPWTMOUSyny5c67LSKFj+Ym7xLEO/k5a0FOt0o3FNURDioRFC
	rbwYcAMux+1O01yxBNzK8x8l93IXR0hR1lVAB61G5KvWm9xZM0c3ML7ZQ==
X-Received: by 2002:a17:90b:1a82:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ab3ab209f3mr7706681a91.25.1791966100501;
        Wed, 14 Oct 2026 01:21:40 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
Date: Wed, 14 Oct 2026 16:20:36 +0800
Message-ID: <20261014082037.1774672-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DWC3 controller can operate in host mode. It does so with a XHCI
compliant host controller. The XHCI has two downstream ports, one for
HS and one for SS. USB downstream ports start from 1, not 0.

Reconcile the downstream port numbering with the common USB host
binding, renumbering the downstream port numbers from 0 and 1 to
1 and 2.

This is non-backwards compatible, however it won't break current
major implementations:

- dwc3 "gadget mode" in Linux kernel only requires a connection to be
  present; it doesn't matter which port it is
  - dwc3 "host mode" OF graph connections aren't supported yet [1]
- FreeBSD doesn't use the OF graph for anything
- U-boot doesn't use the OF graph for USB
- OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
  the OF graph for USB
- coreboot doesn't use the OF graph for anything
- Zephyr doesn't support dwc3
- TF-A doesn't use the OF graph for anything
- EDK2 doesn't support dwc3 and doesn't support OF graph
- OP-TEE doesn't support dwc3 and doesn't support OF graph

[1] WIP to tie OF graph port node to USB port device

Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
It is unclear to me whether the HS/SS numbering is fixed for all dwc3
variants. I checked Allwinner H616 and Rockchip RK3588 and they both
have HS as port 1 and SS as port 2.

This also doesn't cover a potential "multi-port" DWC3 implementation,
which Qualcomm seems to have.
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..4b6304bd2ec1 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -410,11 +410,11 @@ properties:
       property is used.
 
     properties:
-      port@0:
+      port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: High Speed (HS) data bus.
 
-      port@1:
+      port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
 
-- 
2.56.0.212.g129ede20d9-goog

