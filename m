Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3BB40BCB0
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374029; cv=none; b=KHCEkmlb7rBZihseiZPK9JYepDF9sMGOg0Du965OALnUQeJXgUQYUpymlnOup1OII/JYtBfdJ2L9k+lB7yYMAvw0Lyq8ndN/J3FU4Cew4Ranv8jzXV+ewSu+5FKtyDnGlG03BkBos3zCiBrrVPlvWClD3bORc+9C6fsC5rcytNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374029; c=relaxed/simple;
	bh=wbhdzKlsp4pZfdTsaPhOE+ExlEjRAWQ0pqm1PO0FsNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=OLm0OZUBWrG9UvaazgU5RJS1f91SYMWcO/rDQnJt8f7QKzLUvlrm7DSNjqQ6FVbQDtO2pA1E59TUg5jZowYB3ETcJHIZyNJhJGHS9YKYt4myBDqFqQ919UEpp5dNk36Y/6Pr+Af2HEvtvnLyCQlwsC1ymnQ0MAktn1D/m2DLAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IOyihOMN; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IOyihOMN"
X-Envelope-To: spacemit@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wbhdzKlsp4pZfdTsaPhOE+ExlEjRAWQ0pqm1PO0FsNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789374025; v=1; x=1789978825;
 b=IOyihOMNbGezo8tyMOZVabxllQ74/KT9bgYqCXBxYP8sWhcJsXBhUuXcSLOFKjrjHV2xS+CF
 9wV9lwfZQmrxylkIPHs/YtQ+BDSUCcQ72rsoLLKktaX1o2ZDKDHx/tZ017taqdrp2+VYdsiHQMc
 d8IBhBA2WVCzb1u2KMEh+Wr0=
X-Envelope-To: spacemit@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 3b889d0fb2e47b6f;
	Mon, 14 Sep 2026 08:20:24 +0000
X-Mizu-Trace-ID: 3b889d0fb2e47b6f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:05 +0800
Subject: [PATCH v5 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=wbhdzKlsp4pZfdTsaPhOE+ExlEjRAWQ0pqm1PO0FsNY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x6xyjLs6ZDxiXZY9JDtyTshfbmVdxgZ39826q5/t
 u+Q9NzpHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNRyWFkuLEqNN5oQme+dKdT
 Cd+LJZMKVO29r8tGbPp4gNUorlqhjuF/ve29tAWnZr/49l+b0dpdyS3rNM9Ro+/es0sPRThx9vf
 xAwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
and 8. Use a 25 mA drive strength, which is supported for both K3 IO
voltage domains, and leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 6482d24be1394..cb4f4f4e33aff 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -101,6 +101,17 @@ i2c2-1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c6_1_cfg: i2c6-1-cfg {
+		i2c6-1-pins {
+			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
+				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.55.0

