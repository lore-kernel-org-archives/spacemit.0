Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250423183B
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426798; cv=none; b=uW1iZDvToKmmQjmrLUN6TtJKYp26S33Zfai9amEM+8NGddwumE+g/2ziGqGKI2JQTzqi2DBVoLmjvfHXOZgyb/hEtPD+1qaKUuZHbn8FehLoeIJLZJZf06CjkL/T7wVIQM3t3ZceGEPt+QA5QlaVmv0nRp/BfLgMcCz6vcmQX9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426798; c=relaxed/simple;
	bh=TN3IekLzdp18HVU+1Rpq+9TEk2UtnO7ag9ShWepOCxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkKSg9CaH0/pdl47cqwS6XVisjmseNfYoWnMAUBNAneHYxrOs66S+KQtKbw34ZlcELF2c88uAnrkWcLVtUmJ1rqguGC0CjKAR0fjhU1g7Pp6Eg3Nqm58RWhdONPxUObu4r5a3m71wNk2NFvYzeWSQ9zeHrkbQv/fiLuNR6aSY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JRN9kEd9; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JRN9kEd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426755;
	bh=IhNm7b5aaqeGytIsBEHmKesKKDGy9a0voGkBOun2Fb4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JRN9kEd9TIfTE1lSDelpUXhy0yCcuk5U68M0Rr8TX2viRrVK5CjyQoorXI23dVf+6
	 ly/MYPv3bYtEJmfIRf9Nd8Cp+yxsjFeQfwyOubhELnJG76MRN9BFU7LVHjgobJJ8UG
	 P6g84woTsaIbQFubXBewxduiR5snssGArfgLeOak=
X-QQ-mid: esmtpgz13t1777426747t360c3668
X-QQ-Originating-IP: rd3CXtHqGvswSSKw6JZjHsL50HqUHdZsoRaXYQ+43t8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7139710470832578007
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:48 +0800
Subject: [PATCH 3/7] ASoC: spacemit: adjust FIFO trigger threshold to half
 FIFO size
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-3-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1063;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=TN3IekLzdp18HVU+1Rpq+9TEk2UtnO7ag9ShWepOCxY=;
 b=ec7QeL6JrXUVZ6cJTDvuUdDooCidwlmr8lArWG5oMoYjQVIX6WmJGiNfPdpsvXXfGLqXc069i
 /HyE4YCuvkYAufz1dVpsxL1IkXIvH2zfUQfXE1mxlIB7tMZqKJGy3L5
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPhn6Z3dSMVJgSxxaMz2qrwR/rWdpEdp4Kdb0MBNFzEt2sOizj/U56f6
	rCB2zlT2RtpWNSzU7nrguvP18Ci+iNtFfyfz1/fKTSO4LMaT/MqnOP2DDGw1Zv24452smwU
	Ep0Y7DodWnxNtRbJBi3qHWYvh2S005VnTIjBH4xjYF9af62eAl/of50gRqO1sq7i7SrBt64
	O1XXhrGvGaFSmZHfGV/hpetfy9c00aL6scLJ0NrshIFs9N6K0mFcmqp9zQ9Aqg+6GyXW1R2
	WOpzZuS+7PZS//Mj55/NsDqN89+PqCNA24nzlVuqO69Nu4INC7DNLkrQ4UjgKNhrTx6gEmC
	BWsfCzX12z8PRnzVVzoaNmDiWRSQABjDJmEGqJc64tJtRH4ocdaC5nLi59nZbOea1m5BPYy
	hR/ZvbR6CbFmrNo+sEYa78D+Hp4WLIgo1K9waSQPEQnGuQkF6WfPqvnIKtUzcLNJCZpLbWX
	n2Fc4GAw6P/2iOQrZ4mQEmNJUxZ+EnDCk6NeAOczUq96nmENWQHHkbrycVRHxoMJGeG+Td1
	Fkn9mhmeHNA+71QdYReLjt7m5QuUntkkAKvE5EdZur5YdVSOzadY+KzwBrDeEGGhFTjJhGF
	69mfW918TsPT0D815Fo0k1TuIJy8uSX8Wey8kX7UKm7Cf4IvD1FXAgIWjxCNRc3I4//PZAL
	q0L+nCNS27Hz0B+HjbCixPwgnDDbvodsX3ssGk1xddvDHVv/zZ+qRmbM0AgWRdcN2MH6RoK
	s4ZgVRWmpH3OlSFA3sUflT8gM2SWmn5RfhKA1nC0+G4UKqcEwRAQ2GEGLJF5GqEKyTq8pnx
	+jURCWTjumQ46C5lLvwFo2KzhPPglCsvtQiWBZRk18RHLjuIEjpsEf5YoqxBGjjaAHwtNP+
	6B9HnEF1/wkiRLHiUIViBHAfqUvvos56U+xOdWAxiLy7UJSxBO83mi90YmafKYItuVSO9fO
	sswPSmU4fs7Popw0R8GZ6es1GZXgZTWMWBr5NEqFfrWduF6skOoiGlcGyTzglzuTxUHkVn7
	S1xzazKeTaKA3iJhMkN/HyTPGPAPqzcBDC+q4azETe3IbrISDb7F4aKAdxjUgihDcUJDLxM
	ZGHjAGfQ80JRrsu3zFKzodMyWNGs7/DjF7X3gpZk1ZYYEEqqMmkLPv9wXl+3vkT6YEc56zD
	o91kuK8cX9pbPcc=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Set both TX and RX FIFO trigger thresholds (TFT/RFT) to 0xF (half of
the 32-entry FIFO) instead of 5. This provides better DMA efficiency
by allowing more data to accumulate before triggering a DMA request,
reducing the number of DMA transactions needed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index e59624b2e23a..cef883ba4de9 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -93,8 +93,8 @@ static void spacemit_i2s_init(struct spacemit_i2s_dev *i2s)
 	u32 sscr_val, sspsp_val, ssfcr_val, ssrwt_val;
 
 	sscr_val = SSCR_TRAIL | SSCR_FRF_PSP;
-	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 5) |
-		    FIELD_PREP(SSFCR_FIELD_RFT, 5) |
+	ssfcr_val = FIELD_PREP(SSFCR_FIELD_TFT, 0xF) |
+		    FIELD_PREP(SSFCR_FIELD_RFT, 0xF) |
 		    SSFCR_RSRE | SSFCR_TSRE;
 	ssrwt_val = SSRWT_RWOT;
 	sspsp_val = SSPSP_SFRMP;

-- 
2.54.0

