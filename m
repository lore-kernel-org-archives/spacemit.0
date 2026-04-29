Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1919175A66
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426812; cv=none; b=DImQugBS+a7oNsHVihU2+8jTtCwtNyEC1hmQtqzlF7fHa78MKlLINgud6IdlmMos0Dj4GRWHYQ5x+pOf6sUMyBNwcJt46j3Bbr5o4elTwmJoZeTu0NXnT9fBVbzMEiDbrtpI8OPFwHAl01fwoavEtaGGSQLoiTWQazUC8GbUi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426812; c=relaxed/simple;
	bh=qAqcJ83kaw19HjWRQknjj1xWQQygIw8l7xygJK2JwWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXDL8Nidh57xPeYEhKSDuvstbD6mBIt6GCSGPlVrr1gOYWjPk1ot7BDol5otfBEEhY7FkQo9ECduftBV2ySxrjQ2j0MG/wWR8kXXn4iL/7qzS9MOIk/57v8I7RZvbguqesHZrRnCGAUl8uiNvARfzXfIgyzhc8Bnw2vcQPpNo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=iBynE3E8; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="iBynE3E8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426771;
	bh=NSNQ83OsaYFc+31IOLlDSGE8Gku2x+xwHFumIM2Xoao=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=iBynE3E8q6fVrTrjEsX44FkX8YiKeZ6Trw36siTtoxZmjMDvTF80C27aHA6OfJBUT
	 qECcb2tNsAfbgNQcmJlXPjckKPg4Y2fWUPS08PaozpkcD3drZ2aW7CNWaNpiAY0HHr
	 iFyRi0wpuqQQ9/NznJSkqAvpvQYrmy4U//SPXbAg=
X-QQ-mid: esmtpgz13t1777426763t62530b6d
X-QQ-Originating-IP: nmfJNHOigBnEag6KlKG7z7lVhDqeBR83Y7aFBFWp/Tg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 590894259723190294
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:52 +0800
Subject: [PATCH 7/7] ASoC: spacemit: add K3 SoC support with additional
 clocks
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-7-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=3698;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=qAqcJ83kaw19HjWRQknjj1xWQQygIw8l7xygJK2JwWc=;
 b=G4wVCG1wze3HR5862QucHtv0jgAgib3iuet7TLLbnJzILRz53wW34MyK+SMvQYBDp3Z1GLaTe
 Wro6x7DQ6BoDdL1BdEdZTo4wfsmQdUODGqAkBfdolzIpj11iVsy3DWQ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MllZbBbf79Ayz80qaXo/qEE+OnJwdOkd4XXTW8n7oZwGgEzjcM+OH6wC
	ba2iKrh70o5BoP6gwovbqbaq+i8+SWGNQLPfK10rh4KYzGT2GsXzDkYaef+PNiQnjOOZcMn
	3j0m6qKkw6UyfqjA4r3ZHvGyW+AY64DJC/HGLFmUD7EHGaIi3w8pGBh+y5bAhZefsHowbxB
	JCVsSbvdnOHbIgq6CVk6cjpVhBqr8KPCS8HEsn2KV+f5Z9m+t9yAY2fT0A1aKRdwNczFn5X
	a/Yz34fgPZrxZofZxG352wQjGRXgauFmW4JRL4sh/i9d9LgTy/sApG39ATRJT5uDJ6gqM0+
	ljcwo6VNamiD+pWfPkpXg+H+aZhVBmX1I57A7TRtSV1uD7uGkHOi1tZxx1tycfJPp6fUIBa
	pR21NkLvgShxx9Amybly6Hevpz3co7YlwzIcpEOQLrxQ60Dtx9B57NpwzS57bcoU+DdFyQa
	OJq9BTNuZamE0U21URFaCG10DaQgksSFm4uJkmodQoEcrBwBIjRVwCK+okkBLfgaODf86wL
	kdUVn0TiIgPWvFk3hoU7+gZBxCV14h3I1VavUtTvmj9Wuy7JbTk22Gmqm36oYK7nK7SEgHc
	meMW9ljIWRu7r9FRWIwlZlbbp4TUy7PvEePKMljvSojja8Z+cqaWvjYc7MYje52oUWG3hm8
	Vw4DWraE4WFgoiaSpPauOcEo/H/b2hk08LTKzYEkXUmzS7EFZEWoLdchERkVLYEmd/YLNba
	ENjUf6PJZ1law+pGBBP5D2iwR+zmx94KVNvCfjlmwtXtHGbtHuJl28EykfWZLqO1s2BbNJ5
	e5aQ+O+03Og1YKJw+Ri1bbcwzbypUNiEovkJgdftzl+vWKVA7h0Fv3KbyAry5MXffJbfSsV
	o7mBZqL9nl0PNqWTlRuOCRex0W/k/oaRqEf+UXEYgmzCa5CPEGoKFapleqEqITEnAiQP7Sf
	x8T30vhbjNqpWZ3JabC+6fXF/9lYAcBWUnPgG2PTLDGkQrSn1bcMUC5+wKueoYRWPvwuW+w
	O0ek5lH/GJBE+IjHHbrJPTAs8W2i48ujw+DFgkkOgu2WfGBj87GMC8ogB+aQaIuEn21t/o5
	z72JMjsUfADXFR30tTwVe34q66Ybonx6EBHmY8xSzMoOUyu0ix0IPAZ34RbuEUFtFPKIqc6
	zPzE+XU8PyMpyps895smlkADfQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
index 7d0794d21ea6..c2a2b99d91f8 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -54,6 +54,9 @@ struct spacemit_i2s_dev {
 	struct clk *sysclk;
 	struct clk *bclk;
 	struct clk *sspa_clk;
+	struct clk *sysclk_div;
+	struct clk *c_sysclk;
+	struct clk *c_bclk;
 
 	unsigned int fixed_sample_rate;
 
@@ -217,6 +220,14 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -228,10 +239,17 @@ static int spacemit_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
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
 
@@ -450,6 +468,21 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 	of_property_read_u32(i2s->dev->of_node, "spacemit,fixed-sample-rate",
 			     &i2s->fixed_sample_rate);
 
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
@@ -476,6 +509,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 static const struct of_device_id spacemit_i2s_of_match[] = {
 	{ .compatible = "spacemit,k1-i2s", },
+	{ .compatible = "spacemit,k3-i2s", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_i2s_of_match);
@@ -490,4 +524,4 @@ static struct platform_driver spacemit_i2s_driver = {
 module_platform_driver(spacemit_i2s_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1 SoC");
+MODULE_DESCRIPTION("I2S bus driver for SpacemiT K1/K3 SoC");

-- 
2.54.0

