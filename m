Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D32F3B8BC6
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513127; cv=none; b=fXMg63AA5jAkDG6M5v68xBKmbQZsXQqAHfFvcQw03Aloi7gFnG617X9wH0H7DcDWLbWQTah+c5+5OG+IPrO85MCT0seYfm7ed1uCIsSJg3pToO2tG3o+BgJv1VJK3QcyH10i6sXT/ZfDex0jkS0GhsN9mk1ZtzElMHsSypGiYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513127; c=relaxed/simple;
	bh=e9ICveQKvF/Pj981F4inXuWs6rjFz4ZRDL/My9t4tn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwAq6wbbJGK2mPk7MXJuj3viuFTMG9bpl4Qj0AD9DMozkdBq1fBhOFpkA7o8RshzldrcA3e2xjD/taK5RmNmq0r2NuOrtNkAdBq5zZSxjG5BtAIbNob/pcw/r1TFi9ks71l3Ob31G6MwrogdVRKWSkuxau5roZdoOYg3+5gx2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TeCtfCe4; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TeCtfCe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513088;
	bh=s2oQFoR0c+QLUYmpARQQP1qguleDXuKVE28NtoCcXFM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TeCtfCe4Wqb/a5UuLUfHM2T2+GOt+pOfHyKp9CS5hLyWodZ2mYmxQB8D16X5vBZu/
	 m5RCc+xSX/QyjgfoUyAihUT0/g08yuKOoHnvVtH/n9bMBtn+w1Ics57hMA4SWaBiXf
	 aPlJAyOqoW7hmzgEqoBMUuyfphmYpkXe8uAolcn0=
X-QQ-mid: esmtpgz13t1774513086t91d86235
X-QQ-Originating-IP: WElT2ry7tB8lLshZYv4GJO/uXGJxUAxREOVWudDvM1E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5813357295309933169
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:17 +0800
Subject: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=782;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=vS8ZACtafXuUdon1LCamqQGUmKVZBsmItTUIR/tecmg=;
 b=rZ789pdyPNreWYgyYMj3Ulx6Thkc9cK9AJwqZ8/NSDypf/6iqa3XNSMQxqi/NgvKGq3oXLt6I
 u3K7i7aX6DZARoYYvklMbYEx7O6n6Cu+BVZwc5vgZAMd6pwl3BrABPm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbgpgdtno6pkEZ4mtKvzfy1dngFJc7HTbDDbslCYBDzb/m
	pFZerPR5CXiwixm2SX49UWu1De9cJVh2Dp8uG2pd9VhyVPN7BXpEGGH9ZJ0vD7S0y04eLBF
	FQBU9QQymrZRLmpwxs/DsbTWRZpZ8z5ti/GUfp9xvfpR1p1Np0gg23qqLV2BS18zdnsEUB5
	4nJCX5G7FlU2bkX8KSch/q2o6eimqy/iKVgfdOygP0vfzrMRsZL8cziU3+Ft/4dlee+ETiw
	Sj8A70o+oG9EBHlcy1Nr6z0vo9V430vU9cRqEwecVWgeKflqLCZhzmwaonU6cVReRRcs4UG
	oEahoSd+Vpcbz+HuFNo6O/ZnnybsKknVBRSrXyVAM+sSuD49TOh7mR0gVwu6ZaLklpLcPpJ
	EFBme2G4olHZfosWJBljPslMMjxF9CntRtlyoNAdjpTghq1CudICpBLWNxzf0tQAguTVt4/
	3TtygpJ+2Me/gqe1C5xBQ7jGwFdq4cHocKeFzDm0q1RLAi7+pHwOA5X8vg560FyX5TDL+dj
	KTDDTRH3i8at+SU5oTxvP0pX2yr6yyNnIkti6DSJmC63JhM1VreTq14KE5nFxbWQzqbi0Hk
	4ZxcGzZ64hRPQK1Rs4CMqvTJ/9VBv/JwkVwemhw0/Cik8tc97czkSrQmJooPGfnyESq8KRh
	kqlTKWN2Vs4nE554X1opRRLjCPhIfG5hECwBQXF+4rZKtCvoACwu036EbMdB04CgLpuL2+T
	mKq4C2btMAjSOYtFLNrkfQ7SjAYeSnY2XTkKkAMqXcxV7kBvFGcHX9NB9g3vK9OWRxo2TTW
	PzGQmXDRp+YsPnD4b0J8gJSrerJ9T7EgQ899Fc11hQacRABcDsBtRqD+KWVHYVKxuP5yxwo
	9rdPWv/3EGep8B4t6NR4MMYD1B1pT+Z7QNanou9lbKXWE43M4clFc1b0nCcS2+r9BuGQ01b
	zQtzt3HkeshuC04yRvLf1Fs/yvD6bksVfqjb27Z3n0g/2tzbWPqsIvLZtVsZ12qkjXlUUez
	w5ehpBHpp7ksdAQOqRqHCat8F3If1JDMzj9uzoKHBFhXVrnIphgYJO2MBMHubHOpzf4NWWi
	PVO/5TeEqwBV8Ly4Vs8ti4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Guodong Xu <guodong@riscstar.com>

Add k3 compatible string.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5c..62ce6d81526b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-pdma
+    enum:
+      - spacemit,k1-pdma
+      - spacemit,k3-pdma
 
   reg:
     maxItems: 1

-- 
2.53.0

