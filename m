Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38C42DA2B
	for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299612; cv=none; b=nNQnT37wKMRrZ6TtyJ2ZC3JDNf2Sw71T0yipmgYbU7wEClFgy012cbm7uSUWd/23t+xBjxwexSdBO/uWVs4kpaqi3/fXH6/8rAvi8rKmViIZ2tAORToLFtb3hXv2gAnxI154B8Z6/YtIfyFBYHADNZq9CokP9AsTQvW4qTEYqzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299612; c=relaxed/simple;
	bh=zySto7zgwUmAkuL3GnzDZtEv31hl9Eyy1aWzZqxzc28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAs7OSL/1wzugJJuo5aNBCUm28S/UUj5SgCU01m+hgmdAsRmiTSux17SaNoj/xKg2h4Kbn4FHG6QRcvwPQfkiRRR6X5rx6cENjmXxuFZrSKcivgKdhyr7vosjWbF6XLQhwEUbz9Zxl2IphtwlhPOKtMqrTNtYtV5nEpO+OO9O3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5MfPCu+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5MfPCu+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1832164b3a.1
        for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299610; x=1784904410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4iqhlVy0zinCT6tWxaIfEaHrxRoNo3m1mEkW0uTKFU=;
        b=L5MfPCu+Ttwuw1oXG/HisXySaTZFSBPKZbE7S62zGMtuFdAp4eTmrVVwbfuihHB7oa
         wrtG8JIn2SB3jcIHlsST2OLxr5uUtutX1aQ5NOiHs0vLnbBJ71r6mWmeHLtIgROhi3Ry
         kZBRo0COLAFO1KltNGe1WoibyBF2GFzUAfCaIhDsLj2MHqPFfIE2pCcTl2DpSbYADayR
         cuktqwly8dX7E3VYy1VqzJ1fCrq6v0TUgg6j065w10xFtm2OH5UdUI6Cer5RFmvoyYO+
         sHkbiK8HxYu0FdsuNxTl8o2pKP6rSfm8bgVNI7afpsXA0lu0YffmiHSJpoXbCt/owqTX
         DIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299610; x=1784904410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4iqhlVy0zinCT6tWxaIfEaHrxRoNo3m1mEkW0uTKFU=;
        b=d5dimH0zp/0p/ThCF7aFliq3Itw3zDh829TuqeR272pdmIJBSYUZPl8FRdHOyD0QiA
         Ss7VwCLWhV4zUauoyUyWmTrXnN3+pyS2sGhpj+iHEyUo9w6n5nj60Gjh6/yWsp8/qWTj
         aIib4+vnbLyeAGLVbgO4z0w6L6fSmkO4B4rMCaBEBZDeKdv6oT9E9zranNdyiigyNh6w
         wCqI0h99mtEJl3ma2KghbAnAX4uAFwbwUTTbrcTsvQHidN6Ll8CMWs68Se0EyVr054Fb
         5KJSB4k67f5j3/mOUxJOY3K4ZxvdiFucCSdRksaoq03w93XE3OMTmoG8rhKzyRYzjqrE
         5m2w==
X-Forwarded-Encrypted: i=1; AHgh+RrZj8p+oj97Bbk1YTsVrZHyEwqga3olFXzi3X9QS9pfdLEgYaZzugTnpEFX6jEMLEPt55K7I7i2ZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJHKd04Ke2UuLN4XLnwym5Pv+3re05kgniPOZ6iZeVKxnTa1SO
	ajNdfsY/e+r2ZYatq14imdiscds50rli5kx8L3vTQ1e7c/7Yv6dZ7WGU
X-Gm-Gg: AfdE7ckq1y42mvVVQDXbDinQSgsKjtDgOCxc/vZJlOCvOyqMH6nLe360o+538ctd90N
	dnBkOki7syMUvTHodJCtV/4Rt0CdshSeTI85/fySpLNnfF+smhPnifaV+Mh5a/AqBvk8IqCFGxZ
	GmzKyT7oSyjupS71ReHiBYMx6ZpiDIJwodDTgmfp9++UenWazMX5YR/p4mlO5rpjEgbwlWL5vw7
	/pOl36kTLm+hqj8sSWUkZJuiebBjmcAdu5X3/Diw9s2+a8i+8Uxs4X4L1kOdp/9bctaGyiWk+0J
	pmoQSQyTSsGCE8kW1+2XUlIT8bMqkafLUoCYC3RM3MQvHOh4WBe28uIYpJG/90F8U+XVbxSt7YG
	YGY1RhR/q1qxRnmNFWZulVj8UCIr6NZyCnHa0gNJIbmw1wZQ6IPvfNKOGc2OLiMIutLCl+7oV1Y
	nuJQ==
X-Received: by 2002:a05:6a00:1915:b0:842:4982:82f with SMTP id d2e1a72fcca58-84c28544a68mr3002230b3a.2.1784299610233;
        Fri, 17 Jul 2026 07:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:49 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:28 -0700
Subject: [PATCH 4/4] riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-4-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=zySto7zgwUmAkuL3GnzDZtEv31hl9Eyy1aWzZqxzc28=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkA2RyBpFeLk6C50dYyM3otQZs8eLWGMcaVLS
 TzgiIsbV++JAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpANgAKCRDN9pw2gLgN
 2JA1D/0U07T9IWK44EpFEGxgmNNcLauxIxXRQDji7kkGmtw00Mrhd3m7oejDYO4T791hp0aJ2Kv
 J2HWV6FZ3dYK4PwyKMkf1K+hbczfdbuRnJLLGXQ6Yobc6zqchOCc6UBGpf1G1SCUiXwExI7CLJK
 bYzmu1L0703CMw9yBW+zO8jGzJvgTjow74li40wpWF1ytGx5olGNLudSRPPcuAXzlFmflztO7IR
 qebXLMSXPnrGyuvP9pkoiU+ho6l8KCqZxHFeScvISY+aKyd7I656GFXbb8tYBY8YkBqdBrr/IFx
 H1JV5+PU14gtXSWbXk72Ew8Mgv2lel9QhclPYsYCJjLpfGSqRPAIIhwMO1gmWnNws+O8/ivurj/
 gHG0xE5bvkfkm3NR7/uUXKHZZu4wxHpb/gtaE04JlLDpJmhqJ8BJ2p4t2Dsjsku/PwD7pknQaPq
 69wj9CpyqefvGXMD3UiywmVfFJYfI551YK1VHIpEH+dTcAvUwYd9iqb3333TOgQxqvdQC3cPfyP
 6UnAJgoxTG+XfrGK7LbX87GmKVW3jjASB0p/EvN4Aj/H7m+4LFG62czoRVFdDrAAv3VdXWYBg6U
 XIbrvWcahUgR7F3U+0xVJsLqjh7hAuDR0HrUPYqOk1HMvWCDu9IRPbe/OxPEpKU2yJ1xiYOU2zw
 JcmkMEaVPd5sWBw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

SPI0 is the first enabled PDMA consumer on CoM260-IFX, so enable the
PDMA controller together with SPI0.

The board exposes SPI0 on its 40-pin header:

  pin 19: MOSI
  pin 21: MISO
  pin 23: SCLK
  pin 24: CS0

Define the pinctrl state used by this header wiring, and describe the SPI
NOR on chip select 0 for the current validation setup.

(This was tested using a Winbond W25Q64JV SPI NOR chip.)

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 13 ++++++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..01a7135df864 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -11,11 +11,22 @@ / {
 	compatible = "spacemit,k3-com260-ifx", "spacemit,k3-com260", "spacemit,k3";
 
 	aliases {
-		serial0 = &uart0;
 		ethernet0 = &eth1;
+		serial0 = &uart0;
+		spi0 = &spi0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&pdma {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssp0_2_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..9b7617f3846c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -679,6 +679,27 @@ pwm19-2-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ssp0_2_cfg: ssp0-2-cfg {
+		ssp0-0-pins {
+			pinmux = <K3_PADCONF(104, 1)>,  /* ssp0 tx */
+				 <K3_PADCONF(105, 1)>,  /* ssp0 rx */
+				 <K3_PADCONF(106, 1)>;  /* ssp0 clk */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		ssp0-1-pins {
+			pinmux = <K3_PADCONF(107, 1)>;  /* ssp0 frm */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {

-- 
2.53.0

