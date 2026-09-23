Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C0331ED6
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156103; cv=none; b=N4cVVRtPkii/VZe8BU3tvWTyRIbOaNCJTFsCROOrx6z9ufv8u6xnV9kv8qXNMp49a1XI46+H+4eY6HEVZ/NskV53/55u+x6EI+PnnRQLRibot/VPkV6bm7Mr5EJ1pSTA1x8zXVgqaS7L1uKDmKN0IcXvADiJpS3bjUkWaLc2zeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156103; c=relaxed/simple;
	bh=6b0z52n/W0GMXn6vksZC3wPCqgn1ZBxSy4MBhqdVo28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJGDFd1rb8AMIaj9eMvysBRHwnnpkBulhzI1lyiebJkLqxApswEnxJrNuD+8dhBWsMfuj+iZ8U8AXB/HCPcZkDzVgmxim2wfYIbnWRGZ7EkN8E7kj8mpAoj6fN3QI4+H1ZjUktW7K6oJEl7mC4LpA+89xNs3iKlXeAKwy/EYa+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFqeoeQJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFqeoeQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A541F00893;
	Wed, 23 Sep 2026 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156102;
	bh=9WgpHdJRdQK3IRrTzd/Q+VQ6N8VI4jkfl5z/Mlgz2EA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bFqeoeQJ5gf5tSEN2GjLR77sbUEUo1GjzPAAfTyMvSj76EyrparHJoF7Q7OXHpMSo
	 lmmzFD6NLGrfpu1xsmtUld1T9GeO4FnOSyfYX69zE5jkk3UvZiiQkl0shJVe15TpIT
	 HbKsCMXbM6zk59AukUgJN9iKQ8aAJM6JsR8UziyF+AGYxcCSaknyRgOr3bb3pREtLP
	 jby9s+KEcFSxTwRbF338lJE2KI5usSwHwAnUcYNuaAnTlr8+DqY0nCx3qsDCaa/r0F
	 g4RDDJpKPzJdC3davHMWXtFWZNO0b9Yy4xT+b9O/Fxlre5h+3dBBse3iZ1OJifZSi8
	 QNyUPDs/1lTCw==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 23 Sep 2026 09:34:24 +0000
Subject: [PATCH v2 1/8] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-01-k3-clock-reset-support-v2-1-6ec0abb1c7b5@kernel.org>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
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
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqs50my/IKWcGbIb61ywH7j363CgTEw8c3JW66j
 G7iXP4/QseJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarOdJhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1brw//buhRBuis6WZ0Fk93zqkUCzsXQdb40fkoBal1tMjqURug8785UlbFP
 l28Edebi2rLztVH3KD9yN56W5I0PFdIp32B7VRCkMePI4OYNO5iw8Nk48x8cCl/+puoIqLfnd30
 pCdQwD2E1xA1nH3NIFIdZavKIFEZ/zchmB1pRT1OZ1zhVDNX3PUMHZrhu+ZSwSNakXVsTTsi1Cg
 aNnF6t0FIR5nGn/pb3CObmnoDpW6qNUw2mVv0gitQkyWYYkI95q8BoytUQnKfhJVEvuPSPRF2+9
 +6P+m7v7xG6ILwTmHtq9oNZMlr1ICninwTX6n2uzB1E4MnQt2P2IQen+Lp15Mj7RFeJX6z3oUsn
 oi6RvuzEb/qU3NnXkF+ggnmUx+7EfX+g7zlZsQrRVhWglcUJZjJu2hE171UK3h575N4aWKo9+Gx
 SSDJLUNsyT9zAvAtx87kkfmtP+kEp+RZSvkjA+7TDu6B+idMPXq0ZYFR+seoBi93pHEPJsIc02z
 KjZl+J17HdRvcYVjkPL3b8JV6qCD8dUxXfokvazTHARaCUAvPes6xfdjs5oRIKGd/WbYIPg5CCb
 4cAOcBGGE+XtaXeFwzdTjojiqyukhCUFOoKStR4h2iaQFEuKyLo4ZUBmPanQdwvpHTSXvJRgBMD
 tf2gKV6C4vg2kyL4VuU/ESSoha7dCU=
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

