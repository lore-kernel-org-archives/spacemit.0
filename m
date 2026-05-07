Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5432D43C
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139251; cv=none; b=V5XzbxkxfTXWIX7YqLc3OwgNh8xl0GkA07S2cNf6T5aKoJ5/rE/1/pXbPQKWv+eHwjh6sn8nK055H8yWoLaeGsWcW2c7G3NsvQyD2Us/aRKBBSZzj+61znTiWZHl14H+DRtHAzDgPr20U7jUzSRRqTnf8HP24UcTCg8u77wvVFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139251; c=relaxed/simple;
	bh=gaZkV3ycFARSrKwMTq79k40MPy9fuqRXNEp63djnpig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HGhDj5Vky1vYH1Q2dDxzuaWCp8JHMpj1FJLdOTbUozB6vWVo5RJ/PPc+aHpAukrbdOfJaONijeA4lXIqtNEJA4x4kPzkHXeEQFlpfkDgaJ/KzNNEtS++u/6mLsw3rQtTg4fnEeA5rVqedXME9aMPJqidqI+7+4JRJtwddZA2rqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mHW3m2xF; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mHW3m2xF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139203;
	bh=/z8CCUOGvHpoH70t6B2KPfC0Ot+ROjJINhi1y6OoEtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=mHW3m2xFnD4yJq4iGq2uvm+7qKA6RByUi07WaJyScVh+zMKU60zrjvz77U0avXbAz
	 GXP2dgzisy5ONOJpDVse4surR8a0mStPZo8MQ4DHkfrbmdVGGigS2hZfa/OpLxpp8n
	 XZ/IEhy5eNkkwbeHRctCnHs+uVmDs6djb2kvAtWY=
X-QQ-mid: zesmtpsz8t1778139194t8a4b4886
X-QQ-Originating-IP: fwNzxLjSkQR/NKe20e7jVejxzRqkcOcXghif0Al22BQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18142673450067718002
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] ASoC: spacemit: add K3 SoC support
Date: Thu, 07 May 2026 15:33:08 +0800
Message-Id: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ6CMBBFr0JmbUk7Iogr72FYQBlkVArpAMEQ7
 i5gWL7k/fdnEPJMArdgBk8jC7duBTwFYOvcPUlxuTKgxlhHmKj3WTGKumBOaK46ieIYVrnzVPG
 0hx7Zn2UoXmT7bb0ZNUvf+u/+NJrNO6LpER2N0gorStOyMIZscf+wG6ZQutxSw31o2wayZVl+b
 Veg6rcAAAA=
X-Change-ID: 20260427-k3-i2s-52ae21807466
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=1882;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=gaZkV3ycFARSrKwMTq79k40MPy9fuqRXNEp63djnpig=;
 b=RMN4TqCjAj/qHKBOyiM3CT2YI3t71uSVDl2c8KSTGZIcgTj7zJUVROQagnDLypbe485vsjhAQ
 u6pHPyo3UVdArpF+udPa+i/CTg7VDU53shKWgnjR3FVGa3JJ+xsX6eO
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mv9X8DgfILpCQX0R/ZKMYM6+C8N5p548Fr8LO16xFzx1INTEk0ex7IRf
	uI+WvY0QxsxBaEvax2aNpdnwJmSLZxu+TL4xtmMdLOVdNchzubM2AD2Iza9kBRNGPOYhWfF
	qJCBOTKL+DfDCxQOqiX2eQHytcizYFpW//pLdrIfkDiZVlA6qz9b7KyeNMCF3LcOowKQwSc
	ZtyioEr4VpMiPoaRvlSslryKfS34tnUsR+zdyNt+EURVi5OlStDiIKwXDAu1PUf/7640Y4/
	nnaWSShIm3evjs216e32w5zNeQQJZqvylxo7uO6sl+GhmRsfvZ6JG/Q/LT5F3XPZp5n8KBk
	su7YnpaBkqMkfvDKu9MQbA4x6i1hDQqp4TOSVajg6N3yhEehHEmgIWw0xicv1g03pQJJxPs
	dDxWVYZq+2zrsyG0XRDQIGaas+nYYgSSFKg6oMupFygSm6vuv+Yw0agpP6WF1JU/RQ9crML
	nOqIogQSe36HIjd4eJ7DT/JpfA73QsK6f7hiauze3hbVFPq3xJjrKBqC8PiOi0RPt10g7pR
	S9o7mnjrAuQl/gnl+vnbVVYKdSor49csDuzfRMtzPiY3/vL1NUxYKf0Oz1DRM8a1M6zI2p3
	4zJMNfjwK9zlwQKlly6e0cktBk93iu+aZnqraLF3O1tU0NO5tCuBX272Y6iXQj7vaZAPUD9
	fAcZCC+K8LbbLTxJaUhDcKhdX3fTcMAbBFDpL87OZJETLc/wypnZk8J4zNnstKLdce22Z54
	WiYgPwVMaC4omWwadfaMFmzh1fMiudOIQJ/FWOxmOYF/NKd+1FkPynOEfH1dIplt8Hd2qBp
	sy2JCj/Gr+XZFnSR8A5pkWQlXbzZJCxIwQ1fLFtfzzxDBqeFz7CZJSosu9Ijo9K9roAeubq
	nvmT28uIs5nh4RRZ5j7ZHjkjQ4FsTf2pI2uX4honvMnY9O2r5ERbamPrAkby2DZ0dSHlAJw
	eSXYva6sjEGmFuCIfhZx78Emm4zPfo/FcNwa7/4rb6Yyxc9tmcAkL2FZTGqnTjAT/M1JEzy
	LSdyzglxAi8kosq3liTcxpiHx4wSQQyoxPJyKAoH6uqRhRV7T+z4YvA4mk6Aoywwu5HTmN5
	hDBmeCONNqJnBIv+XE+bsHp+aNwGqyJiBXgmjniMdETIZJIBWAqM1Sk9WQQ7NurQV6eCUoV
	Vs34JWZxcdpyFyriul5lpR3a8fKIEh09lYkx
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

This series adds K3 SoC support for the SpacemiT I2S controller driver.

Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible. The K3
SoC uses the same I2S IP as K1 but requires additional clocks
(sysclk_div, c_sysclk, c_bclk) that are shared across multiple I2S
controllers.

Patch 2 adds driver support for K3 SoC with additional clocks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Drop bug fix patches (1-3/7) — patches 2-3 already merged, patch 1
  split into a standalone series
- Drop fixed-sample-rate patches (5-6/7) — will address shared BCLK
  constraint at the ASoC core level in a separate series
- update commit msg (1/7)
- Add rob's tag
- Link to v1: https://patch.msgid.link/20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: spacemit: add K3 SoC support with additional clocks

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 +++++++++++++++++--
 sound/soc/spacemit/k1_i2s.c                        | 36 +++++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: f58f2e0137c2132a08a1ab42720a9540cf0093a8
change-id: 20260427-k3-i2s-52ae21807466

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

