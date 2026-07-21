Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24584448385
	for <spacemit@lists.linux.dev>; Tue, 21 Jul 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627393; cv=none; b=RzalGaPdBmltiPozWYLpUwdcnIuGkRuWAVyIFUnrT9GuEoV2izWgOtmOOLIWFHK+zyASmx5eVArZaWwTsD9DxjN9yM9Q9+7LfKGw6aN19EVQZomG3+w0jP3OBXR6CRC114L6cx3S8M532e9ePNm1pqeqcoDYTg4r77DrvaTAHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627393; c=relaxed/simple;
	bh=7uMF/zan9gnF7cZMHx9exe4LLPPvRgc33P/RP9t39e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rw1dRP1sF3oJf023OFDnnmXpBaGD9scWp6FBJCCh9NWoXq0jftAS9jEJm7Fp4LwwpZ26dGiag6dqxUw2oO4OEyiC3LKSe0pqixnaMmXNtFkbcsKY9VQMgyD9uBOyDlquuO+c5u67OBYqK6LxPrgaXErobinBAMmcm9NcybYtwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OeuoYatB; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OeuoYatB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYgDvv/8zUBPOt0Bkan5pLK6f5pZoY2kPjTQUy/vRm4=;
	b=OeuoYatBX+ioCnxSVS4R6sBmsKaLpqM7WjDK8FzR8/j5Kt+29+c5kshBOf1j8+F4ifvCqZ
	lY0HCaIytaGZjHhluZYjzhLbIvNoZpmkBlPGIHFUx/JPOLDPBdWRVwKiGYNNv4mpqUE4Jh
	NvsUldndmot4LxPvgpBsaKcCZTAgtaE=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:31 -0700
Subject: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=913;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=7uMF/zan9gnF7cZMHx9exe4LLPPvRgc33P/RP9t39e0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDqWiHyoN9T7VLE+U33ts00PlQBO+N2Wxyz332nGrc
 a9d8elVRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESmb2dkmLeBsSz8+4kE41yL
 rmPZ246sLnl08YeyX+HU2z6LtWf9n8rI8MEntiN/txV/SdWR/G8CjS6HUm6+5DlmKV7qOduqz6i
 DCQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to
pads 7 and 8. Leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..91cd08099e27 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c6_1_cfg: i2c6-1-cfg {
+		i2c6-1-pins {
+			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
+				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <18>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.55.0

