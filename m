Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867090;
	b=Ftux/EIwaLfvoclU1AjexjHLECG92Uz56S+rL2WM3nONRUP/bzIU1zDToe+a+QKrW5Eo
	 TFvcFS0huXXZSDfBK6Vo4B23XvfXfTwS3D1rMCxqbiUd8pjGRfqmXtvw10zc/YfVAYVjz
	 860448/2oYb858oyqcHBrCIZx7CmU52UydSjIZcDfTC3MnYnRuJJ9BcJ/H67CFogLjxpw
	 0qZXfB3+AvKqbeLViufCRXHU9w/HPR7fTVYAjeUq4uk86sW9TsuUBgC5d8+1QfeCHLGbs
	 HhX2zJHE3ct+/z7S9T5DJSq3ceJqzNlNrfZeOs+P3rgx+Mw/gMA58yoMfcZoDShU36w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867090;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=hwd03b4oCgS4GqFIi/9dUHS1Ps5EbCjQLunVnbEDyFY=;
	b=UsdwGvKrUZ8BiMdn5fD8pEq5GwlVgGnV5cd8GVGCN6opydNZmy8/QbSDDFek1Ka55Blr
	 b16V7sUGIKz0kNxm7IQpJfMwhowp++K8I5iGHAfc4rRF98esfCgnoluMgk5zBd8cUiqEz
	 44S/kEJaFf627RJM9S6d3uSIfkK8Isoc3HSw1JbIS0iWzoCd7PKtin/zpP/kcFrgCR1OM
	 4pLAg49XVFMgHOZ/zDyM2UHcXeKYvl//R/55pEd9BG/IUOrroyJ/Q9n4on7q40UDHuR+j
	 duDM4OZfcIhBz8pYnR4IT9yUdeURvS+pskAQtSSm2KE5gls1T4hj72gZkljaOvgvkPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=vgMm3iiP;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912B606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E912B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=vgMm3iiP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867038;
	bh=hwd03b4oCgS4GqFIi/9dUHS1Ps5EbCjQLunVnbEDyFY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vgMm3iiPkR4Pvr5Fh2GBO7VT5/BsBT8BizL1WyYLQklQOeVsr9E2Sq6AEA7c4pzrq
	 aS5hRAkRZJpVSiSfu1LGY94DON1KGfoRv9BnzOWrwQ0cUQ5dhO1U9mkGxO/2nQEVlE
	 6PjEQWUprQc5jqZ15XVK6V8kx6PuEhaL0TtbMQ68=
X-QQ-mid: zesmtpgz9t1793867036tc136d1f8
X-QQ-Originating-IP: 6MV5lNBqxWrrQ3epTJah2Gro7KiiQX2i2TCR0ZaOn8Q=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10439336763918379975
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:46 +0000
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD
 card vmmc-supply
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=LrvbgmnWcLNmZtDiJKa0kTwRdFCDSwqAPnOekOW136M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIX5vY+V3WV/lSvwUZKn2XLjr/hFboWOxwrVT2/Vu
 HF2xUGejlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIlwv2X4X+mgKxP1Oez0areJ
 h7x729nvznmxfOo17eOfnV9Kzs3Tb2VkaNY+ZXfg/GZZ0TDRo7WcpbITTARvKN0Sm8n9vsHt2zY
 DHgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MATWLsGrXobhBBI2jLOTzA7v4DtxyQR7vGnGE171GRm/sa3briLTzusM
	Yyu7FEPQrvJl7N34N+xRSMbHRA/Dj67wOCVYGqKWUKOEJxYxXE/2SVtprZNV06xyNiwh5nQ
	uQSKjFXd+YE6Jr6jvSZcb53PmYMJSahLivgbwF3F6GM7eQ2M+uypnGHOm6Aky4ZnzMM9IBP
	07NAHbRpVIrRyVDx265CjuxXCF3tuwCQnuG3AA9VKxiuhhpRxA1sIv0Mgt+ypNvvyWRKSAz
	wRag1sAMm0D3dM2h9x19m14bQ2h4HnJIDU+xNTZCeTFp5ZrdPOzCFGwUxYzsxWtxuchMC1v
	vKPmMOzCQx1LTMYTrmOR/bOD0DdARSK88wHdQbAbOkYIyfQZMC4H+ZNgW5hQCNbxZmPflbc
	olvYUJgBJttG6N5pRCDSbvf8ubOnAEDy8DNHjWQXVpGY+i2DtZ61x61iip7L1bXJexY5xwk
	OEeD7X+AVW/8Qb8CtU63l/zOzsr5+2ywAkEnlVFvjCoDuNQIvmyIw6+Zyj+oLesycCkczYw
	tRzqlC1dILoe5GhOH9oihodlmTyWYxYZvlcmhO4eevEt282shs9aXqzpj6StIRMQvod6Ia8
	Mn+USdqRaoaQrBjqaBxOR6n7ybzoyEDlA9cXbJgUyEu6SzJMjMJY57fu9gtIIyhzv7LnvPM
	u7ppo9orch8IorKd4CUIVrLaMy4NPmQguDSErPGMBmOe/pKYfCoDnwtz6FimO/QTJfKaBUr
	bNrpEHGEe/v2tE31vBlcijP1Zfy20D1czpF5YUoDf3M/381HwcyYv9RvPlOh2hf5/7faySo
	5+XKXPpzyfbtGfnMp+k5FwE2s5hIjTYc9LFxV7T2U6ymxX9ndMfuYYWwbo9Xr/9ex2uO5O/
	IQCBbel2ex2jVBGxhXc0vk4FIjSU7Cw+IEBwawr9l5iw8vmcIm2CZBqaE9Qt9B+uQmP13Od
	ZDCR737zi8qRErN211nCiSEhLJnTmsLAPesfQGOf4To+2ybP4i05wj2gTFFVQYwbkIgYhFH
	HlXXWcDTZ2cTBt3/KqdjN71e4zQKnrrdfUN2LMXCOi0uZNjnIq+mO9MDGKOEriN5f99nhgn
	HcVK48AJA6+NDcPyNG60bNtmUWmJZltMzyeuo3r8Zax1HV8ALzdrLM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The SD card VDD on the K3 CoM260 module comes from a fixed, always-on
3.3 V rail that software cannot control. ALDO4 of the P1 PMIC does not
supply the card, so referencing it as vmmc-supply describes the wrong
power wiring.

Drop the vmmc-supply property. It is optional for a card powered by a
fixed supply, and the SDHCI core then uses the voltages advertised by
the controller.

Fixes: 055044260e7a ("riscv: dts: spacemit: k3: Enable SD card support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index fadcf28389be..6e295bc6f196 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -122,7 +122,6 @@ &sdhci0 {
 	no-sdio;
 	disable-wp;
 	cap-sd-highspeed;
-	vmmc-supply = <&aldo4>;
 	vqmmc-supply = <&aldo1>;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;

-- 
2.56.0

