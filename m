Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F931EEE6
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455640; cv=none; b=FlO+ZM0J/87dmYgnSqEEq9C63C0SneZuRwDITtZNqZdAgRStO2lQIMT2k6FFUU/2djaTzYxbkp6t6tH4rFzPYWwu5L2JGyali1roh/trXfl0JezzzkmtXa4fkgnHCI0grxKNe2eI5bLvnJOMrOCeZJFiVrTrbQQDbTdc1RcQ8mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455640; c=relaxed/simple;
	bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arnIBLPzgEyfDyCJ6bAegDAiEtd7GSCsODmkgENzdg2+v99lrZRuz5pz2Q8YDvlrxC9CI6u9+g69qC55o8+qSX/efH//gfyqHB4Fir8yTQG4EKZwHL17rumNvD9h8RCOp/hp2JNhfw888E5LlpJf7rJGE26GWb2kwa5xV62Socs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=oAAxla/W; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="oAAxla/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455553;
	bh=sNGKriiR40VmWfFFzwCnZIBf5B7xIayu130MyGqFNhk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=oAAxla/WiXozQnqQOf9HGYXRLY0Iww9bfXADXWoyl5smol5EtJMcbh5pqyb81xSCX
	 OcAsYCj2crm6RHa7fT9RJY1IPjcY7JKXWY15kZtGOjacpTPLPB4VrvgUKv4bp4kiHf
	 I1iVXAathKsmXuVek2c+Lo8A3bQ2JOhMJfWKBPp0=
X-QQ-mid: zesmtpgz7t1779455546t364b2750
X-QQ-Originating-IP: cH+OXfIEeHuVZdMzFu6pI+Ce7vT+VIferESzO7hFrM0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8738155976280777522
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:12:15 +0800
Subject: [PATCH v3 2/2] ASoC: spacemit: add K3 SoC support with additional
 clocks
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-k3-i2s-v3-2-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
In-Reply-To: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=3766;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=JsTztEtOCXDQSlvZta39qdd0kWNPa/QXuRXyaf1EX7k=;
 b=hZhgyBa5r9WaBK6RB90JU4T4V6eX1l3KokC15CCQU7blElm1vNKU85QWeehz4Dx/RCd4MJWvS
 tMOXXzBkTHSDYMxzvvDWx1AQUMWHd/9N7WsZO2hUFjd1ATUcpO9Wn0K
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Of/Z+TGqbjgQVygLG12WQbX0SVuZmRAUlRMUuRkQrUCd5GxufkdW4ebN
	7NF5NKlmyk3dtuLYY4BTSCu8ypXglTb0tcWIe6wwVv+eLVLiocXjrH74xLZMY5+r7t7MRRv
	see/lmqm3XBi5MAgn8524niwhjcN6/W5qYxBQ0qohGI4igPcNItIP3G8yeNVki2sYduVRxL
	cA1knCpA26rHERPYIy3IMoFe9a5qSgf6qhXqnwM39BAH60Tk7kYnua33Wkh/ai6JlYiaJdF
	iTqIRmOEt7TRBMvKTVq/yroK0LIB+aAaafukMrFRv7x26FCV4x3ixAi39PnmYOSAj8ABsQl
	GMzkuVA0uMgE9ppUqeFgb2KPEcxb4u4FO5iWVMxkp32HURbjXuzAdKahvAwXlchXHNLQnSj
	Y2QMntTKMY7OVJkicJQ6nkjpijLI7ss5x7a5/1xgZci3MwZVZdmbWB3WQzn41L9n+AB4GI8
	uozFe5dd7p9cG1EfrLV1LxzWuDyS2AXBgppPC/u3C1ph2YhE1Jxgt5lbUcrhIFP0zQ6cJC8
	EPmD6h0jf6Q2Y5/Nqc6qD8mkRPoBW1ko3VyaMun0QD6dxDwdsCto4HD+5JgCzUQzzXG3CC/
	7bhfDwUyvOo5NLea6aljQ/Q3oYfE5WH5cCRxlQ+Ubn+bdor45qm0BC0/w0I+7T4eF6v0tyg
	GnDDSMNDSsNDnnVy51lU8Uc/9VbUv+MqxZjs0VOWF/3M1Qh6kbuR1zbPHDxTkAFkgwGLsSw
	D5HWQh4HcscyvOmCjeqo5C4LGMGl1q08uPwfUEhbMEf1j/21cExKWYsitCvhcUNCV+e2lKG
	7s7wcLL5oeI8+qnf+sKj63Z0ZeaQN3tzcbUXARBtOizy7PvIFWdaz2bmvJCBQ76mrXRnzpV
	RtYQEse6qOBzXKQUlS/fpX/fTm45aahcVxTikBvyHTY7rgaAfDhLdt08QujuPnTsNE0SO7M
	0kJoFU3subVXzpKK6nOeF6FH73wlxtdrIPZcdi/HwW0ptksaSDoXDLQynC/XFEdnh7akmJh
	OiTRHS3hgOWhcpp0hJNgo0Q4L8QaEdre7KpWDXaFnAYd+QYs7szAJtNITQrEtjH+WX/ngxm
	1nPDUOA9vneI8WwSCWFbac2kZTAxEdnDuGI84zjGIz5ukBK+B8sYkL5c+xPspX8Ki1rbv87
	IJF8uGRUL89T6HI4Y5yQPPZ/UWmgA0j2WnaX1MQxKNyaCfkdzcluvOgglA==
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

