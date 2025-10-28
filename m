Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279133CEB7
	for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667633; cv=none; b=m5LsmSAlQKmatc+qFyvDdbNWEBvbffpeYb1R0P+cXBY5+sPLOb35cA9XMbvWAVYGtkseZSYuMVy2gvNtRiiAlZ2NwsJZVaDvooF8xsH8NmdJ35fJMYhyz5Iwf869qJqpVPdKuasguJI1lHOSixxy70X1Xtzb4lBDsh/mLsr2oyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667633; c=relaxed/simple;
	bh=MWE1wHQwpJUdg+s6GjvQ4xmCBSj0KgbizOmtjag6m8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gB7+MJsYDHpAhAcKNYfgQr+424pOl+bktH3v+7MJXoISI7CreSEeSUEnuSFpneOH1n4WFphu25dWkdo3SuBErV2Z7X8Caqb2lvXvZiPLlt8J+gB3EA2YY4NSjsEO3lXQ9x7Q0phrE60gzBo22zbiTbx1Okj0J9lr451Sv1fjVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQQpeUBe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQQpeUBe"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so4441763a12.0
        for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761667631; x=1762272431; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uN8oYIJ23vMsGy3r6Oa4DcNCIzaLKJCXZ02PFiN70n0=;
        b=OQQpeUBeUfdhqEMpkoceFSVnI2WPEtILBH0/t0Evs4p6ckwYU8SEctODgwzquUIcKn
         j9fgZd4tO9g0RcFUrQFr+b4BDzCU5FVB5ZRSNptJyQwGw3ZLBZXZbnraJcNHSZA40slq
         2aZ0YjfsBkJKDJw7dXU9CpeKwQ6QisOYw7VeAtUY2jmNJgQwqFOh/qunICYFs+Var5FR
         UKbD8EizeIGDUfh21qoC8/bCfolZvBECxYXqG3K5FsJwuPY1dGfEYidA9ylmgELnF4Wn
         hfl3mTTOcNJqYVMQ6EuYE7Ybwgz7lw7eQSt7h9CXWvBmx/xGtNtO7bkZwVmAMZqKxrgS
         M4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761667631; x=1762272431;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN8oYIJ23vMsGy3r6Oa4DcNCIzaLKJCXZ02PFiN70n0=;
        b=QzGh5a+pqWN4jYFVgqz0fMklvuUNboduIzHGKD2xRWgYuwZNJ36RQa6dDyxZgo6Q5D
         5njNYBoO9CUHjMZ4rDP0MT1C488Z6aPO/1F0lwlRTjQlkUuNjJJHWPAMmDfU8LLJ53UY
         V2DWcKHMU/Jp5cM4luxTfMQ2L4G2a1mBAI1Cv6uAKI+E1bkwHR6Uw5XHrVSmMMb7g/Yu
         jSm44kplwhAjtEZus8UdY6OC2A7P1UJKtfZqUeWMBppPDsiPhUwhG19K4BIUxGfbXXjK
         NsdDaGHLh2fttNeXW/WLMJOfuiWr7EWtC9ixTBySwqmtcpZF92+G4NNjLIYhBVKMEDrl
         E1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX3da/i/e8Gt9Cd7h5JQxLMRRh0QQKzVDNS1sWpWXG0vUtT7RXabDlVqquB1djgpA5y+uURtsaJ3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkEVFRTPo92poVXq5TCTTXIRPO+URnHx1qEAep2cl5Q8w2oMyy
	OXfoEaGp3a7veAeNmOU7kpFB1aNJorH7DokntXE1VOXLyQMcHfbhqE0qfY5DjQfnhSnmOw==
X-Gm-Gg: ASbGncvqQxx1K1DKhgAZ9nyCOHzPMOHZxCb8EQaI5kBANYQfSGLDdhEZdrfVQzLMXMg
	SzVuxW504aikbnWPMFFeBpPtm/HMp/UyoP8GJgIA07J7BUBsI7zhu5KZuuICCF3gg7KFV4S1WTt
	k6UHXgDy+VIVLP8qllowqkj3TYrlDVZnZn9tYlgqJOJ9CwSYBbBdp0CbAY9rB9J+YRraF4i00Vm
	ZAgYyj1wuX/ck9rAWKrIc6wtW5OGpNYptQKIokNjcwb4Y3wIVrQmxqyW1bmQQ/CNOGgpSHTmVEN
	HBhd2Ga1vp/oBSYJ8mUePtjqUxqqcQxq8GEX9GCkBAqDTJM5lsVbyU8j7zMa0hYYUOHhwvgaQ1r
	uR7kGj4rLxjyjHRYMOjPXPdH2bbOnu2NF7BnAm0v1jOeppQAAROTo0YYZ4HyCj2vAa/VglkPd
X-Google-Smtp-Source: AGHT+IGyT3KwH4uNk2S8o5U+iIhprzitxR3BDiviNoBBo/Q2/S/fxc45ypOS/S3o4J1sE0jtlwrDTg==
X-Received: by 2002:a17:902:ea05:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-294cb35e795mr49845185ad.12.1761667630674;
        Tue, 28 Oct 2025 09:07:10 -0700 (PDT)
Received: from localhost ([240e:440:d04:10f0:5748:527d:6b58:a56e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41700sm121030795ad.95.2025.10.28.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:07:10 -0700 (PDT)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 29 Oct 2025 00:05:39 +0800
Subject: [PATCH] clk: spacemit: fix comment typo
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
X-B4-Tracking: v=1; b=H4sIANLpAGkC/x2M2wpAUBBFf0XzbOpcKPyKPDAG8+DSOYjk302eV
 qvW3g9EDsIRquSBwKdEWRcVmyZAU7uMjNKrgzMut8YV2GU4yIVEB87K/d5WNL4gWw7sDWWgyy2
 wNv9r3bzvB5vukgFlAAAA
X-Change-ID: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761667622; l=966;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=MWE1wHQwpJUdg+s6GjvQ4xmCBSj0KgbizOmtjag6m8M=;
 b=W/Nr03DugBRDanEde1X5Xv65lFXEPtYoAFcNg3Xwe4XJbUI2CxrjAH2YEeDNx85xNZJnWBfsm
 MjxogSDotZYDEXJJXvdlCNntvVzBXTXCZU3Vub/F3pyPxu1m33u9CXS
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

ccumix.h was copied from ccudiv.h and the comment after #endif was not
updated.

This patch fixes the incorrect comment to match the filename.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/clk/spacemit/ccu_mix.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..c406508e3504 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
-#endif /* _CCU_DIV_H_ */
+#endif /* _CCU_MIX_H_ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

