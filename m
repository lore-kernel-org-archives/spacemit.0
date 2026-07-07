Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFBF3F7A8C;
	Tue,  7 Jul 2026 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426462; cv=none; b=IaxeeU3Xqxwtk3fqTOJIRp78O018s+23EQx6OBBVE01iOeZAGraQj9h3WzFDxQY6aIRusNnDwty4OJErhQ1pP/OuZR0pnbcEuDgEBKoh2UT/hpN00eOye8LInjdHjwG7KOLQGfCvtzx66vTfjHJrUHI+YxMKDN1O4zQgWRyK1gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426462; c=relaxed/simple;
	bh=0fMo0Ai5b6OPM4a+oWovyOu7xp467x/HRKSIL6CZA84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sygb+1bfy7I29dd3LBO5D1Um4TzYsOSk8cs5ORIPAqKrCvLQTK++9CCKI93GZiB4HYema/Sr6ACCsrlHgtdqPFzobNzi5Q3WflgKMo3HeMwhcoBKoF/5bF9e1fvAj+dzdXdCw9H6vzVqPR8iPf0a8GCCu/Zg0nGHbUec5T3v/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMdnufIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMdnufIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF07C1F000E9;
	Tue,  7 Jul 2026 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783426461;
	bh=FLZItHyiaMaW57bwLBmHqpv4/AV1bxfodu1YkXciPTg=;
	h=From:Date:Subject:To:Cc;
	b=bMdnufIXFQ5ocViqnfxvhbZXDlEoy1MZIMpTs7n1ak0ik3AOXWCDy47lr+tvkE7YV
	 OC7so3z4TmkPtzfme4nQ17178GHB8HwvduMj40PjO+H6PvEADwNDA4nyy9xQeG9Kuf
	 VK62pYxyKH7yugqRjoSLVA0u+S/ttfuVoLJXwOK2Ho7b8qu00LwXzmrseYIOqsZ1pq
	 2pNI8EkoSX+NxCxg+U7AjAfqyjHBONoTJeRRn1AqdPNGKEqvBDdU5LGAqEKURCjQYa
	 qP0AyH2lmJj15G2S3TlBlB7AzEDEkYqeUX2LMp7NM+NjryJnYY9N86vGU9FKaQCeJV
	 g7JmWSc6GJtKw==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 07 Jul 2026 12:14:14 +0000
Subject: [PATCH] MAINTAINERS: Update SpacemiT SoC git tree repository
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-07-spacemit-git-repo-url-v1-1-137697316a4c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJXtTGoC/yWMQQrCQAxFr1KyNhAHcUavIi7GaVoj2g5JK0Lp3
 RsV/l+8xXsLGKuwwblZQPktJuPgsN81UO556BmldYZA4UiRIvqs5sIvmbD3K9cRZ31i6g4pB6I
 TpQiuV+VOPr/05fpnm28PLtO3B+u6AcS3aqN8AAAA
X-Change-ID: 20260707-07-spacemit-git-repo-url-8f48a2009087
To: soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0fMo0Ai5b6OPM4a+oWovyOu7xp467x/HRKSIL6CZA84=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqTO2YHOfT2CDVqOSeRNJn1VpcYMih4bVaKMYjA
 Nab9w+s1AOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakztmBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0FJRAAgzgj3q+JVVDUOWL/QynAmeMkQbF1LTITJ0bH+iw1aGAiuIyGLWss4
 kkejHVfGlGMWje+wfmHLHZHOjk9+c9T+CUFljcPgyQuyBe4SgtKBWd0DT28C5ZODXBpsRnlSOxK
 O1TpXezkzDUq2OeUytwwkNE0mZE0LN4gT714BAdK2NeZKxEC3gE6DNoGj9ajbxqqiBor4CjRBzN
 THwFC5C8pn6azyHUbAdFTkRKzjolXH8RO6EWEnHbUf8EfsX9sSXt9U0yXsQYPYKeduGOwWlWiwU
 SoQaColvaG+B6/BapwZRaIbf4wRcQ0oSSbar6ajw7Lx7cStOthD8Co7R1FMex3QozNsLpZKy40i
 BhPrVI6dKR13yTjmuVfeKlPGRmjCVfsW7hs+KYngS/cLhPnuKrYdYVBWOEUoK6wsY9kTUzF3d/w
 6D8nD/9oEFWWUtftfTkXDpy+TBQR8jZ2N3xr1i5Y3+EfkXsdFIQoWIbZnMBLf4eBjRxm+w7vqla
 8RRrYwyWIj9phgd53k/GwEaYm/rRvlgKUCBKM/jU3SrKg0eOeZ+b3G2Oblf0VwWP6Cel3f8BA9S
 M9UJw5HctXvhXpgJBDNsB0ZCnjc6OIPMoKnCB0cIZrBX69UX5xVwqp+4lmdiXrFqanYsFBFVi8w
 dBi7WlfYz5FeU7f9/awc7rHgAj7MQw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Due to security concern, switch SpacemiT kernel SoC tree's repository
from github.com to kernel.org

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Hi SoC maintainers,
  Could you just pick this patch? otherwise I could queue it in
SpacemiT's SoC kernel tree, and send it along for v7.3 cycle, let
me know what's the best way to deal with this, Thanks
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..a97f48464e19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23312,7 +23312,7 @@ L:	spacemit@lists.linux.dev
 S:	Maintained
 W:	https://github.com/spacemit-com/linux/wiki
 C:	irc://irc.libera.chat/spacemit
-T:	git https://github.com/spacemit-com/linux
+T:	https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git
 F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260707-07-spacemit-git-repo-url-8f48a2009087

Best regards,
--  
Yixun Lan <dlan@kernel.org>

