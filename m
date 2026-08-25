Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398A23BCED
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 04:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631911; cv=none; b=VjgNus+5YYlD4syFx7s7ckRUpTH4Q+LGZU/CQuY7IxCGRzZ//GkleY0EmgrzPHY07NGQsRwL+9GSDsEgpitsa0TqEsv59zqu0e15LnY0XtfHaTtEdmB6eCxnZuXaT6ZhaEfZLbjxX7/w73v+1M1A6wgG+b3yL8Wk7BDI5Xj5St8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631911; c=relaxed/simple;
	bh=6b0z52n/W0GMXn6vksZC3wPCqgn1ZBxSy4MBhqdVo28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBB3KklupVCxBjQV7ZrIEzZ0lIK9RyDT7dq4evsR52TLb88YXrgWNvntVM32SxOM0ETV+eLCyI4LL51e3cQyT96MFzLAU7ERNV7J+tesuTM7bOjG6MigBLd5YUpsvuzo9mQIqCtMw9PI1KOwyZrG/22Qpa8D4rf3lhg7+PY+ais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKF+BF1i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKF+BF1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C801F00A3A;
	Tue, 25 Aug 2026 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787631910;
	bh=9WgpHdJRdQK3IRrTzd/Q+VQ6N8VI4jkfl5z/Mlgz2EA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fKF+BF1iJ/mdO6kO/8as8MHIuGFlocHeqycYij5FF4b4HQu+suS42n2sKSXvPhctf
	 kfacySNESRFBQLYjrexb9roLgNvSxubn+LsFFNcSI1a2w+mDooJErxmLDEEb5wW1Rn
	 derK/V+lzYXtXW7xi/85etsqX8ofFoixa1YqNUg1yRhsg2yxKuX7oVg8TFeNFJKYRv
	 kNW6tiqk7fpxi3CDLgbQPT1RwyLUQ0SaSRpdNup/oTAa2q15XUH+iPR/U3LMxMFYF0
	 Fw+3AM3Ae5JiNOa4NOmeVof+S8uYDAP84gnWBujCYn9LZgi1hN0u9xRWgY229Frnfh
	 HJNy1DQqSbvhw==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 25 Aug 2026 04:24:11 +0000
Subject: [PATCH 1/8] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-01-k3-clock-reset-support-v1-1-c430253e759c@kernel.org>
References: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
In-Reply-To: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
To: u-boot@lists.u-boot-project.org
Cc: spacemit@lists.linux.dev, u-boot-spacemit@groups.io, 
 Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Raymond Mao <raymond.mao@riscstar.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
 Torsten Duwe <duwe@suse.de>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=dlan@kernel.org;
 h=from:subject:message-id; bh=6b0z52n/W0GMXn6vksZC3wPCqgn1ZBxSy4MBhqdVo28=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqjRkGdCAWNncikRKWoAMMoixxfZwWAQbjE669W
 WMXv2g6B8iJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCao0ZBhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1Adw/9HgcH0tm8ji6ekHtXpV93WqyRdPrNfO4onemVZyrwZ+1ARr9qkVWS5
 4TCtyhNG4tCRx0jew0yx+CcoC+OEsPuCJYJbeYvixh6mwUYbvPRsJbmw8kPlETSfMMqnSfO+ddm
 4zphg4wi7eQm1+TniQ2J8/7Fd7hzqbDvKxwjL36Cf6lcKVI0CFeM7OTTetmFzbB+VwzBf3THTxN
 b7bWNj+63mbyTat7rjWJ/yk5WULazFB19W+gS6MG3PDQn8MFv9CoW6wj9yHHH1gUA7Y9BwhVJNE
 y3wYxGjRYNsfm+3+m7AV2Jfz9iCei+L7jZXnhPQEh1vjC4FctPEVSmCY8msEl+7Y2nPRDX7Tluy
 AEpVF99QJwRQcrhOGU2JCMSH5+CkM2KBj0ZsHOq2vwkkSt8lm45c+fi4mQeS5WMElzZq97lemPp
 Jd4KXhFRF1nx+yCgCxTFUF48R5828VmOQUvTpG2RNZXBbjPQByOYV+MeLPU2Rxadx1BvlxvJYFR
 /kO1n6WHR38atXrZnfTeYLeWFsIwnaz5AOz/xxyVcAcvALsASYZQmhHVryrmZfjIVnDy7m0qpKY
 Icg0XSzPMUb+mACpLxDwlNMev5AfEYPbeu6sK/S5sPvSwfDbqnCcF2HqtHrFj10kKVIBisTzHdA
 PZtLefRzfLOtOpdSLFdw3VfaIEc64w=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Based on upstream commit:
  54e97360b44b ("clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()")

Fix inverted condition that skips frequency change trigger,
causing kernel panics during cpufreq scaling.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/clk_mix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/clk_mix.c b/drivers/clk/spacemit/clk_mix.c
index a1158512a92..45bf2c72375 100644
--- a/drivers/clk/spacemit/clk_mix.c
+++ b/drivers/clk/spacemit/clk_mix.c
@@ -78,7 +78,7 @@ static int ccu_mix_trigger_fc(struct clk *clk)
 	struct ccu_common *common = clk_to_ccu_common(clk);
 	unsigned int val;
 
-	if (common->reg_fc)
+	if (!common->reg_fc)
 		return 0;
 
 	ccu_update(common, fc, common->mask_fc, common->mask_fc);

-- 
2.55.0

