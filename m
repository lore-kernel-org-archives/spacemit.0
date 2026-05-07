Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B034104B
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139251; cv=none; b=UCcW2jXFiEvGcMiulR7DnDz6gdKFih3sppwB6gHoB8IZ0G76Hap7eai+ozyUl7rhPsAn3rjWxdpWIJRkSp1fqFePt3c+JRLR1SEt0nJE1J5gee+3nDjOJbHjIuPJGqBUTiqbkfFyoy2UVPbVxnT6LKSYcrRM7Rw1PfRlihZN3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139251; c=relaxed/simple;
	bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0JMYsw5jPBEndY9Uwu1OlNpoJMvCFvkcO6/k19UPTP9q6ucsTWoYmN2NbWxX5VFa+GMjYUy2tXVOy9fKiGXtwki3mFQWfpCIB8iF+fI5Y/LJ5xsh9zLNzLP7p8/69ZdWolikeBBn/fH7ZhPtrL5QgWbEHGc1EDnzcdl6jNqMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Zh0bjdZG; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Zh0bjdZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139212;
	bh=sNGKriiR40VmWfFFzwCnZIBf5B7xIayu130MyGqFNhk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Zh0bjdZGfm5x3Mf0Ilwq+U9awVpBm3O6XiCIU7+au+NmoW6KbRZ64nCxeM+bob6v9
	 GzQHnSOGLUM0DP/lFBG/HvtX/fXCnruJ3cPChDDCdP6jSOF9oPvSJri05M5+JL98pg
	 yfqoDm2+8UBPlfpT3efIxxk9IvdznrIKR5N8EPqc=
X-QQ-mid: esmtpsz16t1778139204t1a57ad0b
X-QQ-Originating-IP: b83GRTmEfV+p2G4kcqjkirxS/rl14spABcxEkQaijBs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16449511194882650999
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 15:33:10 +0800
Subject: [PATCH v2 2/2] ASoC: spacemit: add K3 SoC support with additional
 clocks
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-k3-i2s-v2-2-9cdbf95b7533@linux.spacemit.com>
References: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
In-Reply-To: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=3766;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
 b=r0yBhUD/4AI+wOAtXpcG8m+6SLm4EeSISUy/2tFlbPs6+5ZF/Ikq75NEatFFZVEcEAussiwE5
 /h5vua4a+/yCqPS18KNF5+QseFjhi8Gpbm2id9mJE9HHs+ywagEd+a+
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkrRBJhjB9W15NpgT9ECBMWmaWl5CZaHPSLd5g4KD45gXzj46ylitOdT
	wmAF4/q0Xa0IvoOMf2so4FYoYlaPBMuBi2MVIxYYgcNRtoagCrrWpDJfQguH46aWZ76XJch
	3s+Sohe/SmBVWFqY7oGtzQvj9R3G8CQ6dbTnUDf8RvhNYLI5kbtsiPfCRzd7Su7pTyC6jGq
	E3y0ymsV4aBoF8K0cKOB6GN5MmZwT2qelw4usVHYcp+27qBitQNpS6QNp0UV7PCIRT+Jl58
	KaR/8ZLlKm/nmUIL9BvEklPQqv/fTyzrSbAUbFfsjc99w8i9hnWWORBA9vjIJNHNdNWy1Qa
	R4X83I0VhKt0YFYRC1E7U1UcnSgdAqXTJcw1d3KJrVJHJak8+oQxfg01cHWOtArr4adSJVv
	BeGKtc9VESgcOZSDtiP6BXyAJsDpxdSdPkz2e1A7lv/m/JFKc+qYtLviD6mJykw+8zo2f58
	rvtFW9zUzlakaddaSk0ht3psNsTAKoAQoewi0/+soMKs3aLPBVs3Ez3zDRdZQ4OFZIlK2Zv
	hOaGK3wgo0+DFzkoGWt+DGOb2qnI3KRN7gtpCwub4wxu1jHTo7R026enbR3bIGmMZoEDaYY
	8VIwCF6//ssQSQh22VUj/IWjrsdCdtZqqOVrPP2hUbSdHExjxsf9h4Q345yDGPSIw9V3kB+
	w7CcuwX6plI5M1a9X9ZOtSPKsgOWNVHX65O8MCDRPw7SVOcr/FFy/YexseXE9Kv1I2lyF6/
	AYUf5z+lLFF5b19D4Irnj9UGc/fpygwTSvzUglsuXLct0d/vnTOh36sIXfvjCCcVI1rlFD+
	1JS4tlfLM+q5zo9eeku3CcA14VG9knfXMUM6lctfde7TD25jjJaWSKuwI1AvbIa5pTqRHuv
	yTVzAnxw98LnDYLyjdvVyuggde06UTmnfTXZ7X4oJRTD7Sb3II9R0xMqza7qOLR/4WmF/zE
	dEAFdgTeFnfHVYuDNNjqaJG+r/qrj0/bNsuaZIRGh3EqW3qokmJKE1fkNggj2tgcdBjOSZ9
	fO+7rhd0OFrB6mMWVJ7NDDmtuCDCeBYeYh0T/FRgajWwrd893yn2f4u7YRMhE0XR3pOnfBS
	/LneugEexpihtdhSfp8vLu082dk9I78SZPQOwth61ctNrnTULZal95EcG3flgawNmNpyFFx
	DYWzYa315N1GKZQbx2PkXqb0LlJFOrVLGvm+
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Add support for the SpacemiT K3 SoC I2S controller, which shares the
same IP as K1 but requires additional clocks: sysclk_div, c_sysclk,
and c_bclk. These clocks only exist on K3 and are not present on K1.
The sysclk_div clock is present on most K3 I2S controllers except I2S1.
The c_sysclk and c_bclk clocks are shared across multiple I2S
controllers on K3.

Use devm_clk_get_optional_enabled() to acquire these clocks so that
the driver works on both K1 (where they are absent) and K3 without
needing SoC-specific match data. For K3, the sysclk_div rate is set
before sysclk in set_sysclk, and the common clock rates are configured
in hw_params based on the sample rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 1cb99f1abc7c..4e655d714623 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -53,6 +53,9 @@ struct spacemit_i2s_dev {
 	struct clk *sysclk;
 	struct clk *bclk;
 	struct clk *sspa_clk;
+	struct clk *sysclk_div;
+	struct clk *c_sysclk;
+	struct clk *c_bclk;
 
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
@@ -189,6 +192,14 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 		    params_rate(params) *
 		    data_bits;
 
+	ret = clk_set_rate(i2s->c_sysclk, bclk_rate * 2);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(i2s->c_bclk, bclk_rate);
+	if (ret)
+		return ret;
+
 	ret = clk_set_rate(i2s->bclk, bclk_rate);
 	if (ret)
 		return ret;
@@ -200,10 +211,17 @@ static int spacemit_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 				   unsigned int freq, int dir)
 {
 	struct spacemit_i2s_dev *i2s = dev_get_drvdata(cpu_dai->dev);
+	int ret;
 
 	if (freq == 0)
 		return 0;
 
+	if (i2s->sysclk_div) {
+		ret = clk_set_rate(i2s->sysclk_div, freq);
+		if (ret)
+			return ret;
+	}
+
 	return clk_set_rate(i2s->sysclk, freq);
 }
 
@@ -418,6 +436,21 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
 				     "failed to enable sspa clock\n");
 
+	i2s->sysclk_div = devm_clk_get_optional_enabled(i2s->dev, "sysclk_div");
+	if (IS_ERR(i2s->sysclk_div))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk_div),
+				     "failed to enable sysclk_div clock\n");
+
+	i2s->c_sysclk = devm_clk_get_optional_enabled(i2s->dev, "c_sysclk");
+	if (IS_ERR(i2s->c_sysclk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->c_sysclk),
+				     "failed to enable c_sysclk clock\n");
+
+	i2s->c_bclk = devm_clk_get_optional_enabled(i2s->dev, "c_bclk");
+	if (IS_ERR(i2s->c_bclk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->c_bclk),
+				     "failed to enable c_bclk clock\n");
+
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
@@ -444,6 +477,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 static const struct of_device_id spacemit_i2s_of_match[] = {
 	{ .compatible = "spacemit,k1-i2s", },
+	{ .compatible = "spacemit,k3-i2s", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_i2s_of_match);
@@ -458,4 +492,4 @@ static struct platform_driver spacemit_i2s_driver = {
 module_platform_driver(spacemit_i2s_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1 SoC");
+MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1/K3 SoC");

-- 
2.54.0

