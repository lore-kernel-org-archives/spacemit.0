Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D727FBA2
	for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768113690; cv=none; b=hQZnwjvzh4ZSKmt9YsIlrxlXMkiTuYuUtbj8r6PdQbLb6G6LMGOIhv/XTmw17szU9Yh0ulNQ8QSkAOrvbVoew49WQ5Sbpi0tlE+NJfDmrz5R+fmXPzjpV38h8ty0s0XHVzb+0kb9bhgW6Fm076PLC2NSU3+2MPJ4/sbA1+j9+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768113690; c=relaxed/simple;
	bh=OkFD2HGSr1MsKeR9yPZO9Cd8GOid74MlNIlt7D1ODFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbCqsAsSaCTXTanNf5KJevs7w5AM7rnKgK6X9paRNW4xD1FqmRwA5QyL6Z2rjEtTub6piVFvmeY+PJO/aVL5P5IVzTLl54ToAUV/ZDF6+x18bBYrz9rNDrTTKAnAy/IfsSGSLCysgPGbXnhg66S01P04v88cHkWAL35elGlJI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SaTvT6Kr; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SaTvT6Kr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768113685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=566hMGT2wOOA5i+sdnfFimS5EhXjb0N0TBNQUsy89Yo=;
	b=SaTvT6KrPH5cmadrgS7Fw5PtEBY2Fp8TWmc95KdgXXACnE3+nV98WMI40Rtc8iDsQOJu90
	pzz+WIc0lVx9hE5Vkg+JEQmKP/CFjkdNNQ88RUi3SzE1DFtSadUuPKdwLrp+7O/LXrTFbN
	IE7KN5FOmYdeIAv766qYJWHfNduDCCg=
From: Ze Huang <huang.ze@linux.dev>
Date: Sun, 11 Jan 2026 14:41:02 +0800
Subject: [PATCH v3 1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-k1-usb3dts-v2-v3-1-f5ebd546e904@linux.dev>
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768113671; l=1040;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=OkFD2HGSr1MsKeR9yPZO9Cd8GOid74MlNIlt7D1ODFU=;
 b=ndsEwPbqczy5gANhQyfrkhX4hlhszRxEsjVbIagDSAlfPx861WOm8rxEXFnEI7JkrtReHKy+n
 6j4mXBz/0i2CubvJn7FtYfkpp4rRMXWQweG/ezrNo2Q89IK597lSwvi
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

K1's DWC3 USB 3.0 controller requires two separate PHYs to function:
the USB 3.0 combophy (for SuperSpeed) and a USB 2.0 PHY (for High-Speed,
Full-Speed, etc.).

Add node for this second USB 2.0 PHY (usbphy2).

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 86d1db14e2ee..b44149f4f076 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -424,6 +424,14 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		usbphy2: phy@c0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		combo_phy: phy@c0b10000 {
 			compatible = "spacemit,k1-combo-phy";
 			reg = <0x0 0xc0b10000 0x0 0x1000>;

-- 
2.52.0

