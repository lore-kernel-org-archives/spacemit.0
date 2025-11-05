Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AF3320CB6
	for <spacemit@lists.linux.dev>; Wed,  5 Nov 2025 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358611; cv=none; b=HThkSa3ndnGL9HO5btWosfFepX08KbHJYm6yrap7KrsQP1tmb+zbsXWjiA2OK9vUBMSJDPkAUmFYqx/5LfDtpzjnDudp+C87dVrScqONI5D79AJe0Uf2NaCKSrX2I73UNmQ3TLm9n4Vd/a+7q4Z5MjAZhy+kuWY8Dl6NfV66yl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358611; c=relaxed/simple;
	bh=l0Nk7GVBJ1qI7KNylnbSMpoEa3nN+cyLJ8/L2EcFb0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T86uURcf+A6knIWbBA4SiwTtLBQUmrX5cE1O4W15jIfzjzfhPran9a1isXoAhrDnDf9IKrKNTPuZAdxQXNOANVm2lbzQWhX8CZbKozdy1eYgE3C/5RHQOfQ+hYjeNWbZaTNBj4xUJYpSlaxnM3nOzgBroeC1gMxUwtOhdc78mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpZspeYY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpZspeYY"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-793021f348fso30861b3a.1
        for <spacemit@lists.linux.dev>; Wed, 05 Nov 2025 08:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358609; x=1762963409; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=JpZspeYYYstCHIoNcx9gsjYfSqalYN0WuCmhDezueGAW628uiB7DF9tubO5Wpr/Ae1
         X+WHB6dYtR8EH1koV3+tu8vXgm/iPtjkJrKemqwfrbhAiG4GhssAjs8BZuNsyHfubiZz
         4oMQ75upWHMdYdPk03vLSEyFlja/ZxsmSpNu2w6Iy1+5E++4Ub1He1gBVQ3KkOG7Xu6X
         YmjpmwhN6hoZbsxKuq/5Kxit8m2b/P1bKzP21jIY6wdEkw93q1NFqqOj/IhrGxs9bCfc
         hiGqjrzLmtIaAMBs4evQOqFPcdeaSY+Gl/dwxFCmkx3tiB/wY++PxqUOSlnhyNkl3loH
         ngUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358609; x=1762963409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=DO+3W7+17jvFaWAFq7LpUYvst4ofd3ia+ahnlvlE6aqvsKNJ7kXlpaS//V0Flw4bzx
         +2kH9hWT4iV4U7TyoX+T3GZgAMe+XODkZ6t6DAhVnQuNXx1qVGKfOghExjqj8T6ubqEh
         hInWbON7U8ajP3MM8MvhR2+0B6K7hMMJqAcQKzNxnXAWZZ4qDfEWwZ2U1CUACvE6Ulu0
         lNGDP5ToToprsWiy2DK5dMiRnJ/QcjQCfe4tkyPChNQ7TxANmVVl4clf4ONPvEg6iMcf
         NET4H+8D8rDmv+mdDg4rAYm5yfzaTeG5vOPs7USNLK/WTTHvJGuQgjUowJcWhI/mdRsr
         2Agg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tdRV73kZSY/MRt7NtpA+XwUKnw7OugptyXhqoIJGzo5vUZrJVh7JeABY1ubiEMr6BDH22fNY9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCJlLTf4AN8h96bdk4m7mI5nfvIkeGNO5QtOaGvrrCMT6+fDY/
	7dC6krozQh4uJcRm2DgRQgSgQ9p9Y0qzLcLIiKGwgxMTFAyX8GIdLMB2
X-Gm-Gg: ASbGncthhJyG8oiyjCIfZahFokSFmqqLNyMJx8bcyhfK9PiJr6XGT8XTgNgmdhJ2w1K
	p7q2Zs9eH/iIWjV4uK+mJhBCYn4ppx3gYfGYaGvNmRxn5u0pW73Z7ZvYQLckDW4mSDjfYlAiVeN
	eo+Izak5V1/2HtBGEh+TYHGBjqWomlOBAdon/xRGyK9stgZkH0ZqyROxeSgVGfAc8GqoaWJMN0I
	rTKcOWQA8Ue2Jz1+CbhQdn+LMRMdp/JNPu4b5LiD2ltnwDztIGO3q/kqxmhlgPSVIKULtVSPHzo
	ueYzSmD6DMLY6Q9fd08QndhPRP0dbtTxW7RLpfGT8xeYVaash/lHNWXsSVhOD0gCcDpnlcUUxCO
	NGFUL8Gs5A3917hQaqEUDiGgGYLCd5Oy/PfxHcD0n8wmUfrKNgMvp67srZbj5TBX/kJ8D7WaP5N
	cCwg+sPGUDKkM=
X-Google-Smtp-Source: AGHT+IHJwjnUIGI8gDNaxibj4sXg44XjKfIRuSM7Iw8kysNt9Y+apm7udBv6IooCou81dlnb75b3uA==
X-Received: by 2002:a05:6a00:a03:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ae1ed9f9femr4377537b3a.16.1762358608506;
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
Received: from [192.168.72.66] ([240e:441:9718:7c7:b13e:ed12:9e56:bf18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6823f78sm6638331b3a.63.2025.11.05.08.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
From: Goko Mell <goku.sonxin626@gmail.com>
Date: Thu, 06 Nov 2025 00:03:16 +0800
Subject: [PATCH] ASoC: spacemit: fix incorrect error check for sspa clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEN1C2kC/x2MywqAIBAAf0X23IJaBvUr0cF0qz30wI0Iwn9PO
 s7AzAtCiUmgVy8kuln42AuYSkFY/b4QciwMVltnjHYopw+08YVsBWd+kNo6ts75qWsClOxMVPS
 /HMacPytboKhiAAAA
X-Change-ID: 20251105-spacemit-i2s-fix-e63d655ab94c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Goko Mell <goku.sonxin626@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762358601; l=1364;
 i=goku.sonxin626@gmail.com; s=20250522; h=from:subject:message-id;
 bh=l0Nk7GVBJ1qI7KNylnbSMpoEa3nN+cyLJ8/L2EcFb0c=;
 b=XpqASyQW0RdHbCLkEf2XfIsntbTBZK8hH71TYZgySwP0P0jIrF2a24Krhc5ELR/kzKnFBR+nV
 WhQD04oBe62Dg+xi0OVCFhFRVVymT8BGqaaQW3Tdd9/O3KDLSgKAMh1
X-Developer-Key: i=goku.sonxin626@gmail.com; a=ed25519;
 pk=YAEtp1QQ+5hMv+clz+l2GN5MRRfR5AvnzZi99Qxamqc=

Fix a wrong IS_ERR() check in spacemit_i2s_probe() where `clk` was used
instead of `i2s->sspa_clk`.

Signed-off-by: Goko Mell <goku.sonxin626@gmail.com>
---
This patch fixes a wrong IS_ERR() check in spacemit_i2s_probe() where
`clk` was used instead of the correct `i2s->sspa_clk`.
---
 sound/soc/spacemit/k1_i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8af05e1604f518b63cbbbaa66b73cfee8262d87f..1cb99f1abc7cde3370ca643c8b955132d8a1013a 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -414,8 +414,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
 
 	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
-	if (IS_ERR(clk))
-		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
+	if (IS_ERR(i2s->sspa_clk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
+				     "failed to enable sspa clock\n");
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))

---
base-commit: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
change-id: 20251105-spacemit-i2s-fix-e63d655ab94c

Best regards,
-- 
Goko Mell <goku.sonxin626@gmail.com>

