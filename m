Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F83FADE8
	for <spacemit@lists.linux.dev>; Fri, 31 Jul 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492985; cv=none; b=malZkMmTNk1+X4OWyKSXz2jH2hq8pGys5/Zrumrw94fKQh003CqyFUiqI8Gk+Fu7ni+mqYeoVtyjNzEAoQxy3XkT2dJhBQ0B9h4J1EknVyHtyW3D3hpiFiYDb9p5FYmT+Bh04MT5HTKZrm2JzqIkKkU98PPVmWvaVx7Xso1lH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492985; c=relaxed/simple;
	bh=tIZl0SczIAIEGn6ulaKByJ4cIgNcPn8uPvyKgIjiEDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH1CPmRsoEdxmQ+Dts3rhJtY4/ZTsO61AwRdf2rt0da5daHqo3fG6qA2xAWpr5pv6VssVPaBZ9PwsOI+7gvNUMx4u5KScKb6vILkAegKE5Vsm/GGqyNRuP3Us0JkvAnfKwHqeuiFk8QGFvOuKAPNmYue9zBxaRLJhhhLuopa97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elgb4uTR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elgb4uTR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so933401a91.0
        for <spacemit@lists.linux.dev>; Fri, 31 Jul 2026 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492972; x=1786097772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=elgb4uTR6T3tBk6vb2Yd6gH3a3RMtkdTSgz9CLwZwKdoHE900kNGLBCMYfrEytDxnI
         eY1p0gox5mCLEeXQcWtBVT3d1oDX21CLRan5GD3/Oju4MZMxrDSKg8xX6ZbmLisqU3va
         VVCHult5PvswvenUfcqq8r+rKqOUD3yh0Omox9kCytqdrqI08kQ5TSNXaHYHfz8vDkdo
         cnn1VMEdAgXPtZ2hrt8upN7Kq7RrxVtpB5+4a3XHaqKb9n04hyeGWl8161y5bZJ8QwW2
         fYKDC5q2XfZpp9W00cyc1+q8BV6gqdh+4dtn22oD66XIO8GeNKwe/S+/or59qKAr7BAm
         KMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492972; x=1786097772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=nn89GgT+SyQUzNfOKbkYas2+jR7P4YajYy4rb3Gf603qSwTdrmDiQlpfaZuPslDqk6
         DeQcIUkIbkZNYlYm/w7bRsDn1L3I7FdImqFNSQM4SJe0LdldbrBEHE4d1ZqQ4pCpyJlW
         tpPljYLpCOWNxtq3zhH3mnNq6tEtt+bltwcck7eZZ7HVfSQ0VZKfooqnXGpDHIrfc+ei
         n3HZQf/pxFfoYylsKwIHAH8h6n+jRb1HlYnt4JWFKq1KTUxp0fJ1EqWHzV5KkmSrQT+b
         g7dmr1UPlHU9tPBeeFIWDGB81JiYc2r6uEgtzIsr6nSwEOob7SM5ZglS7qkK4TJXf7jW
         qzPw==
X-Forwarded-Encrypted: i=1; AHgh+RpkAoG7+Vyq6cuoFoQT3EcODzlm+mZT7TyQIkmo0Z8eFXHLfIvVIMU4pLEBZ/eoYBF6eZhEMFu4Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzesN2SVqQvdApVzrZgXmLqwWi/POlGXWHplO8ns9uHshfWUcfd
	7ullWfKDb90A5E1wBa03Yy8PP9OE2PUhhKxm8IwPU4mpVDnY/p30IVwn
X-Gm-Gg: AR+sD103E1m9/r59Y1b87dvSARQaDlWxsmK1s92AMvlHg7q0oxsF8VtMGhOVv6uWTML
	khBZDWQ4gQKiAZVtFC7OQVyN4pEapqZ++rnGZQX6mNomSBCIPfbMuFdevRTr2b+FE7Tz3afhxOj
	Pkc1q4xgeIWS6HKOTlrV0eIERfjJM3Belf4oSj4cfwx7W8aqEt89bxOu+wJQIrawW88g3A+G6yM
	aICRj5O8dFChOQ+zUOUeYxgbC5qHcge+VGECAvuFFyggLwHtcFFQSwiv+QbRbgFGMIP9flJ8F9L
	KB7ZEAq+lM0HeECAKKaGhP+he29uPObiJzXl2RuCZ+97D8PPvDFklojyquGlB9w5lMiy/kZY6aO
	asQuQUg82q7Ky5Ptm8TW+g8HN2Q/v6u6PbnGR1tsPLc6ZCLvFOPoYyK6eiJrAGAhKE+JXvWScoa
	y6a9gusTDdrN+/OSBl1/qLcy5i/iTNVbzKCoFzhJ4qnYNqbYz6wyzEgG/l7dbi6jRuQBmo/Q8kz
	Z57fvxEluT8B6M1Bo5TOd6AssR4eoXwvsY0ylEzjt8RhEh2d9EyAyLdKPFmoa8qhphwewb6FUa7
	J2BH
X-Received: by 2002:a17:90b:4cce:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38fb13e74femr1383086a91.22.1785492972150;
        Fri, 31 Jul 2026 03:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
Date: Fri, 31 Jul 2026 17:15:39 +0700
Message-ID: <20260731101539.36290-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

spacemit_i2s_init_dai() takes an optional output parameter dp, but only
assigns *dp on the success path. If devm_kmemdup() fails, *dp is left
untouched.
The current caller does check the return value before using dp, so this
isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
measure, consistent with how core helpers like _snd_pcm_new() handle
their optional output parameters.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 64510c9a1a89..23037fa4233c 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -382,6 +382,9 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 	struct property *dma_names;
 	const char *dma_name;
 
+	if (dp)
+		*dp = NULL;
+
 	of_property_for_each_string(node, "dma-names", dma_names, dma_name) {
 		if (!strcmp(dma_name, "tx"))
 			i2s->has_playback = true;
-- 
2.43.0

