Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971186;
	b=U0dzW430Hg6mP9nY0e1Xfd/Yn+QIA4O+7kjy3JU7D8VLJzYiHLxJPl80bTBdTXY0t5at
	 xc1WlKBI54J4mj5dP6P7o6IaFP+8kAcTWarovjdC5PbY7r9fCbrCiR2+6rA27hrrIQ8ae
	 IDoehwapMF7gEj10O6bJ+AoBFWOGimDrjTin6mqiaIUU649OwL49d+oqEljcfOboWD1J8
	 YkTtdyUp5ywT2CmhVuslUZ7/sHif79D/vANzFDcSc6CwnBuZ/tps3ilVtMoMyKH5akeLv
	 TdIyLqA2kgWhXE6ZnTzeZgDD5zD11TOOUy/L7PGgMikhDj5xWgStD0eUSrHjZcB49Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971186;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=JVf5Z4L493biQzcZIUPq5WSeKo5jxSQPgvOHK9iHNbU=;
	b=e93z9wN6vcOzu+ZYaiwF5sCLSxb/X7KGS0xq1rLR2H32xqIBn3OhxHbMkBIH2krjI7Ya
	 55REJ3iSSkB+OBCpMig8kGs08KMfvyM+zUO/PMlMhva/U7znosDCs66wZMB3a73P7IAjg
	 2tIK4l0GtO7j85LlNyGz/kedFjOHAlzAGx898XpNk+28krjV9RWXqCXrYRjRwGHVUJK6P
	 rfux5fXyW7jdGyz2sGQXx+AFaSXgDK7hrMDvIkyrPyTyCZjhiyr2EOO5K17MwlwYxR+xP
	 gKdAfUvFZr0kz5mXGBjQXS1lL5M0Wr6Si9HCx6CKDB4KdhPH8KmJp2NbF92m+4/UY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ClDhMaZR;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2045606A31C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 03:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2045606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ClDhMaZR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794971118;
	bh=JVf5Z4L493biQzcZIUPq5WSeKo5jxSQPgvOHK9iHNbU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ClDhMaZR4HNDzWf8gp1p2oOY/dkzabWLPp84r9vKh8WOYIwUOg5e7Kc5aO50Bs1wF
	 JywNEqxHFGPHf+sQ+TDYIPo04Rng+JidhfGuu33olH2aTnuZfWuT0XzHRSIj9gjyqv
	 7lhWl39goLdQKk1t0R0IUb16/YuGedMBFkf9fh58=
X-QQ-mid: zesmtpgz6t1794971117t96746eb8
X-QQ-Originating-IP: CtE7MWfKIvGwwWKdSM4dsr/RIPUw16t0C8P3Ex/CTfQ=
Received: from [127.0.1.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 11:05:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18325639032088577285
EX-QQ-RecipientCnt: 15
From: Peixin Xie <peixin.xie@linux.spacemit.com>
Date: Wed, 18 Nov 2026 11:04:33 +0800
Subject: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on secondary
 harts
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
Message-Id: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW7AWcGkVwkvtt1jjpDJTEkgv
 ntrXX4Hzr+RwxROl2ojw6quz7lAThWlMc53sOZiCnVoRaRjU08rP6KlUTMP+uEGsWnPIQtqUPk
 thjL/mtf+b3/fJqTXEaJ9/wK1tqKVdQAAAA==
X-Change-ID: 20261118-riscv-marchid-fix-3ea3672d1e0e
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 stable@vger.kernel.org, Peixin Xie <peixin.xie@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794971115; l=1952;
 i=peixin.xie@linux.spacemit.com; s=20260727; h=from:subject:message-id;
 bh=+XmXptOpB9qNChqNiEmskdTqAu9CpoySFZwuHevOeCA=;
 b=soX/Y5u/Zof/TqDEPMOha+JkSm85SjmlfwBSkakoCGHxFRfWao9VmVVnZg/ZsWNXcDY7i1z0z
 b3fqqDc9nfcAoJrWhMbXxEj8Z9BLLAUG8F7K7unoT4HSC/thsDrZNqK
X-Developer-Key: i=peixin.xie@linux.spacemit.com; a=ed25519;
 pk=jczO0FmEQZBoClfXslkwCsHKDmSRchQ1hQr8W7yiiXg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MgEbn4EBW630fat+dXVQ53NChTRhvpKaIK6yZeoWdnfX3BjQove+7k1K
	LVUw15lJWdK7g8fBC+fKKO5gwDem5gkNOUFLcsU3jHAINcidzskjzTSroFXiOBsGKH3KjX3
	4ZP8kWJOW2QZ7IZ32hRvxV8UU6UR0cHv8bhwaDp32d/1MeRwUIg95wOJheIBM1w54flMV0T
	MTQNfyi/vWqK89ApYwni0hk6dGwiPdoy7fKw35CvFmmxqT6U7bVJDT8X0kenseOQnz6QYce
	HSyOPMNpzyaIOiK00eM5snF09Jcug2yqiF7Y90EGJHYbfsjaiesodb1EpOSB3TUpbgPpX4g
	0ngtKyAgzH7RPugSgnrLoBgud2PLIZssm6W3A8bHiRL8mxoo8IQ6lzSqoDOicrLGu+XH4wy
	TAeYWviloEIF8VlUOrQpV9vaI1rICzmNfNpmtcNmJPXF1ZqzERB6vKhwvKWTnx5NHSVxkUR
	3JA2aaKwRhXvlGxQ0cHRHgFXK8iBgY4AY5oDJDkF4ieH5rX1k6ziGw7cgJLka5OwVBqnf/R
	JVgO+93GBsuqWKHkzL3sKXQnM7frzL3qrkLQ1PSh5XZHX11wlWEebvL+H+RsRqpTRAlEmP3
	HuvSKV8ne7j9G1fXcrXCg51I3QYWiyj/QGXWf6aZn7aDOBDt276aCyyJCqqQ2HyKwMLOwds
	Z2VDpGWkRy5lsp/QjgqBtt7FEMEP9azA97Ak259LmxEI+VhDrxRLyjrPm4j7+/kLYoQczRh
	LQRcd23yVTDMvlKqON1vrir1Ez9Xo5Y80LVYHmLiFNg3+DOoLx0pbi9But9MCLMC+lzWGvJ
	2FaZKjHZPZBbyteZC8F4OhGwVSu1l05dt1dA2MxaHQrvDWaB5mOqPMDnSEJUzZvPVe0I1l1
	JWiolGfPMQX0v0LbDFXKZkKOI0fjbPTLc4MFfM4CnROz/46LLk2UZkBPp1FRgaDdHMyCTjg
	3Zgk5ieqfA0PYhHym8gRGEyqd5OaU7ha+R/pKV+phOOyF91AaykvDIXEUBPk3zBwKyp49g+
	p7GTjTbWu4xCSKvBMV/Eo6pneFG5tMMpSbg6AW4hvMZA3VtoHaE0IThuy9VfHXQxKwKt0jt
	urZZqKiNmAkJ+cB7CqIqSI8x+N1n35R0XNslmMgBNN5v6kL5ZPnOg98yHe3bZeuUw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

During early ISA-string parsing, the boot hart stores its mvendorid
and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
which copies the static per-CPU data to each CPU's allocated area.

When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
are already nonzero, so it skips reading their own IDs. As a result,
secondary harts can retain the boot hart's IDs.

Read mvendorid and marchid unconditionally on each hart, as already
done for mimpid.

Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
Cc: stable@vger.kernel.org
Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
---
 arch/riscv/kernel/cpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index af84b97af3a1..64c0c83eff76 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -197,16 +197,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
 	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
 
 #if IS_ENABLED(CONFIG_RISCV_SBI)
-	if (!ci->mvendorid)
-		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
-	if (!ci->marchid)
-		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
 	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
 #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
-	if (!ci->mvendorid)
-		ci->mvendorid = csr_read(CSR_MVENDORID);
-	if (!ci->marchid)
-		ci->marchid = csr_read(CSR_MARCHID);
+	ci->mvendorid = csr_read(CSR_MVENDORID);
+	ci->marchid = csr_read(CSR_MARCHID);
 	ci->mimpid = csr_read(CSR_MIMPID);
 #else
 	ci->mvendorid = 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261118-riscv-marchid-fix-3ea3672d1e0e

Best regards,
--  
Peixin Xie <peixin.xie@linux.spacemit.com>

