Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDDC36C0A7
	for <spacemit@lists.linux.dev>; Sat, 31 Jan 2026 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895520; cv=none; b=tlTSYLGhoikdN603PwpifH/QCqaRxU715LocV1GxFun5b3JrEX68oq2NNMjRZB77W4ipm0ot2krqhmhgVunPKm6tu5jaei6ta7VuqltLLw3LAnSqu+XTWMFJk1XWs45kyAQu0ZZO2IkbkRMWJc1DLDLzPxhl9pV8hVk9QqbdQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895520; c=relaxed/simple;
	bh=Pm2l+FpmwWwWmeOjvXpcn29N3BqIgFcmAvl0n69hkIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqxeVu310IBUvohQBUxw3Gn2KZfsN6dkCJ0PzsR3Mm9Yldld0TA9WygCud7sC6dJjm7ZS8SppuTn56jhBs0DJy0JMFDokzDEPBF0g3MCFYLNNMQSKhABh0YTFO7y4KENKd8xoYuamNMi83g4ODRyoepE99+OpjmhhigzXnXBvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowABXadBIdn5pRJhjBw--.18091S4;
	Sun, 01 Feb 2026 05:38:18 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
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
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 2/7] riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
Date: Sun,  1 Feb 2026 05:38:09 +0800
Message-ID: <c5799da08242f8aa1a77f144ab0273d68af1841f.1769895215.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXadBIdn5pRJhjBw--.18091S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1rZw4UXF4fAF1DtFyftFb_yoWkWFc_Cr
	y3Ga4SqFWxXF4DKF93tFZY9ry5W3yv9a13Xrs7Wr4UG3Z5Zan7X3ZrJry8Ar4UGr45GF9x
	Zr42vr18AF1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUOdgAUUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCQ8EDGl+GiNkAwAAsH

Define the DC power input and the 4v power as fixed regulator supplies.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 93880ba7bdfe..bd1e45e95e38 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -23,6 +23,25 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.47.3

