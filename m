Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814D156F45
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271681; cv=none; b=cBJun9GqxoIK3jyv3hH+/dQ/OS3nSET74B9izdUlLjNAHhj9ZFhiJeQDRxsL5MxrMyFPrFaeWJg52dWqWCI8ZbJWbD9chvrjxwMIpGD8aduyrGjQCxQ8ABMCs5eeH+mYx8eb3Bkp03igRIFQ3+M6+q4tNHXDW6RVk/j7lIE80DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271681; c=relaxed/simple;
	bh=yhhPlPoErkV7U1OZygKFQp5vWYV/hKg6zzSze51YuvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DThvQeUPY1nveh3aPz822M6x31yllDPPfcCSZ2RTejXmb1ehs5/LPnt4Q5Uz85NC6CMQBwnNVgUJe5uEb645CflL5hQpridQOJ4/kAYC4+RWezBUR1YG6fWOVD6GgtgDBg60rdLLkJoFc016yUs5PZ8qC1MEh+evNK7F04+YTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=akUeUs4r; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="akUeUs4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768271563;
	bh=8OGm56BnNU/xjbkupYm2Nu9TvcJ721VGVaRdZdzerGo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=akUeUs4rsNN++0aI6+L8wU1tSmXNOlJyg1khp6asNN+b/aTFscWjwsaJsV5atER6q
	 pCoI+ZMmJjWlGJVwiMVxltPwB1lcGXGlCYoVPdQbMulsPAhA4mtWV15v3QaDYstrEC
	 7j8Nm36ri758sZ1xiGj8v3MQCpM99guCq6PlkDxY=
X-QQ-mid: esmtpgz12t1768271554t4138d555
X-QQ-Originating-IP: hxT0YY0pelbElcL0hcdNSCii+H590ZFHp4LoAnEKDu4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 Jan 2026 10:32:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11578108700935340498
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 13 Jan 2026 10:32:21 +0800
Subject: [PATCH] riscv: sbi: vendorid_list: Add SpacemiT Technology to the
 vendor list
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-spacemit-vendor-id-v1-1-f9650fb8acbc@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIALSuZWkC/x2MQQqAIBAAvxJ7TtCSkL4SHcpdaw9ZuBGB+Pek4
 zDMZBBKTAJjkyHRw8JnrGDaBvy+xI0UY2XodDdoY3ol1+Lp4Fs9FPFMVStnDaHHsAbroIZXosD
 vP53mUj6rzQpmZAAAAA==
X-Change-ID: 20260113-spacemit-vendor-id-841edcdfbf48
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768271552; l=874;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=yhhPlPoErkV7U1OZygKFQp5vWYV/hKg6zzSze51YuvE=;
 b=S/JY50cA4FFYl6PPTHC1S2/6TSvubMHtzhNzvHUKQ16CCghxnvKkpn/03h4ex6Yz6TAQnFF3T
 Jz4jyId7r5NBmm8xPRLzSxEXHTDOdT2g0B+bdq4MdkD3EALH+0vJ7hv
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPhoNcGPHxa8PhYYAfOGfMS9xbdxhzsPRKsW6ItxDlFElKzYUWoYFZ6S
	rfnl0JD55QK/5WpiJclx7hls6hA97oZTTXMYjC+juzIFbTYugFYP6IErG8yZwGRTNPBs95X
	ze5wXp3jYPiYn6qQILwQvSwTr3ZPsaS/QWcTbBoovkIdbC+v/muEYNy6s6fcNMSXGv0iAt3
	KCisZUcHA4yqRj2dGjMZNWt595j5F52oGGL4oCSUMsQ3jd3kAWOvXhGkWmcorpLsnsLd9sx
	hQBjfI5Uc7jZQ1LUV539THtK9ofH8OttCFSPgG+8FP15bTcbnrWJtshEsu2hoTaFDX3PkXT
	8RrwzUdc5Ema2mk0AeaKGJgM8c0f9Fni5tpa5sbtVBBannySQODCt1A5IQQzFaxGbjBxd+U
	Txgxu0YVeKt9laV/qzCM9njKYbByx0Nc5CQPU+HxJqlIQqbiB2GixFyjv66FCRMHKnury/U
	1QnQzVMPD073plYq0kSBcg0q0Q5XGeZP913tSf42AWc8o3Qf2VSkWeDkK1RgysanK3qplEi
	1KiaFSDCaXG1RjkbWyHoUd0L5Oh0nVuSflsUqakhYlWwaKuomP0vDVDbsIpqS3MUJ5jq2f5
	fmMENeNGx+YhZqT0MXtWQqkhFU1Sm0T5yeLkx6sqnZ8UKgBgx9uURgMXwzJcfx89J3IKTwH
	pbEpIas+1Jzr+qp61eDoQmRe+XLV05SUOjvcrxwZasFbKEBQLKd08ba23XCZ72kr9a8VOkz
	xKO9OK0xiwoMyxPmZYgaMQr1QdJKuRnK1bpUhTwo/v14phk8kZG3f4+zE+c0HpBEJvWi8um
	OhW5jAjJ9QvRAU1r2/VXV3fLEVsNI3DxOQBFoSB56ySdPDjUyDqbc0Ccn2p7EYAQbP7IfMw
	OCH3FkCmpwXscH9p2G2VZYL5hMWAXnYKEqOcaCidlQkEslJzIOS0j/QhJ4i4nsv9QgdVJIW
	3A3pruZI11RInIizPTY16cfKvzoXvLZCPWAG9a/XJaA1LQQiTJAIn0Pl48QGW2Tms6o/fAh
	4Fxmg5bXl9foCYRgYEoAhZ1B+1nH2w8QgJFfm8IuevZMdX7ErVNgThXX8Q++dLPJ8hkcoKr
	eidKwRTmA2wj0bUBNCD0k23mwXQ8SlUoQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Add SpacemiT Technology to the RISC-V vendor list.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 7f5030ee1fcf830b17c6529e9c430fe19ac68b05..5f75408ddee75d1e45c2c72207c66c5905f9b84d 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,6 +9,7 @@
 #define MICROCHIP_VENDOR_ID	0x029
 #define MIPS_VENDOR_ID		0x127
 #define SIFIVE_VENDOR_ID	0x489
+#define SPACEMIT_VENDOR_ID	0x710
 #define THEAD_VENDOR_ID		0x5b7
 
 #endif

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-spacemit-vendor-id-841edcdfbf48

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

