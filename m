Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E6246782
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426788; cv=none; b=ije5rN4zoylR+ALqWi9G/A+UQIUsAvRDvYzlXxfoydMDr6QiTZptZEk2eQUDkaBKLdX7jG+Jh+2pb5MyiwXbAmNQ2vV5DKqvXRLUtF5UNnW28pDqNi85UD4uvKnhbPCexT54rwdNoTiilpOwh0h3HNiIM+i5VZm6oJVg3BGzito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426788; c=relaxed/simple;
	bh=RiYU+SgXWMHrp/bAux/PQa9K09I3u18v1QwXk28gNXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=svZcEIwpr40jAeqnK3gNvuGSwUxuf9Ch3wOJ9857OvSsBLBNmnKCy85K9cvRqE8jRITnZ3QLIyP7IWZyd2VJLkYlSHV88Owi9ERfEZh2H9YH4vsWPN5cFnmWZBsKXyDjrj8r+0dVsyOwCgvFBQmOmzpOWzz2YRfB+/FvJ7vytkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=CHyW+t7X; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="CHyW+t7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426742;
	bh=1Fe6nYs9JHsL/qqU3dPyTkXSVgm0ocwnWDhLNVSkbzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=CHyW+t7X5KK4KmcVe7YZL9VwnhZBbzH2921c1xt1fkB4Hqq0gWjAJ9xTLzIXwUV5V
	 5NhXboG7JE2qLKleQJ1eMnZFYFvrASMqDuEbGqCwp5JVVERRvQ6zUxCwmmvECtAz8M
	 OkfamLmjVxWZfF7v+UPWVaXmGli9P8stCmeeb5uk=
X-QQ-mid: zesmtpgz5t1777426734t39b15ba8
X-QQ-Originating-IP: TPf7klzOlR5kzfZDIyJIWcHEw1Bvxv+z3hDvlJHdUQU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4341323507646280445
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
Date: Wed, 29 Apr 2026 09:38:45 +0800
Message-Id: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNtagyWvIheLwVBoByl5d4vLr
 /5zLhByTAJFcIGjg4WX2SMKA2gGO/ekuPUG1Gh0gpmaYsUoKkVLGOU6S4wBH6+OOj6/o7L6LXs
 9UrO9a7jvB82ZfgJqAAAA
X-Change-ID: 20260427-k3-i2s-52ae21807466
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1818;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=RiYU+SgXWMHrp/bAux/PQa9K09I3u18v1QwXk28gNXY=;
 b=dytFIX3GzeFkPj8nZ2Ocz2RD8jraZK9X/o93auRjGbFdCfGSTcixRXOrk0Fn6gWjrkeRQdcmU
 rpz3VTbG3zhC7S+WlXOXbzADbMTFLbs8xc1ZGGftBcOYSosKCbspItK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MDbbjBkt9SC094+zwfVm6O/k5NTINlFWbHifiHSs3DqIpKEVRaCirKf7
	MtcAlcCjlGeAnzOYzLGlQlCGHPTjmz8HKqHo4fkqdaLInAvQRe7iX4g4pxAf2nkKqHlq+Gq
	yYvxOynbQEXISdChSVd+4BTD/d3He5OteJlQcuv9RVR2UuAzixmJKzRrAYSiunLpDG5Q51X
	dHnPOAAhRBnt3a0T0Nqgyu01TwMjCUHZKjKxsRd6EvWuDcWmmcLHK24JCZCRWNSZR8KsRW/
	tlT4Z/RurhtXr99agzAGd+F8BkWF+tjPgrNy/XL36dGpvGHIBa74wS8uT0su41rDlkBAkLb
	ll4aVXVpLOIErqKl1YiI1AALxv+V/bZEVUXWe2vF38zaevekphSjpZXuWCmSmzh2O983/GY
	6BULIkdHnwAtieHPTihSEUJE2hI4bHqbqU6jAtMliUpP4vKAZtIlt4TD6A8URfhSjp7wM+V
	iPTL6x1JYAmHjuLEB4OU9Zjl5v2cSVNdm7nHuWuvg/LewL2tp28LY94LfSD80HMAKNC1NmE
	DtiLr6LKSXyaiLjNXJWYyb9DtLxx9pvqU4vler/OjDR9rxrxj90toPYacBSUsEVBOQdd7nF
	/lM29Uqcj91yroOU1/JwpA4Ok0ASFmgYYIrp8KTqvvZmtkoHW7lGvRxRqV5rYkrfQo1XYVW
	sDeYkb8P54jACWKdZslAGN9BfhKDFHbBcFxxSKXUeBCSM7qCd/HiB6Ab3vUupQ99ZeNGPxA
	tpHl26qmwzHdjZr8FXlJCd5xpFSOlQJGI0j4z+9Vp2zY9qX0xq5ns/lgdXET+549HElaKzL
	hqBZQXsKJP58ZEQGgQ0KRs1ytQP3OCgSi0PN7CcPrviQh8ZcWBP/TRGZxomF1/bf4FVWLcf
	sFCAoDtVNpsfobfNbn8mc3hyvZSRQAz3SK7SWLmA/9hsCvQfHpDUVUhH1t5ALlOCnOSGhE5
	F/GEVcNe1OoVpQ/fcRkdGtT4wak5tvxD0oaNWzO5wOD08m+pXvimf9AKSOj+d8FRNKXD5d1
	O34RXO1+DT9DSTdZ81/xnn7hYGdLH7Rh9BDuw228mVWOMuNuEsbcwdcr7ew46foRQlKEdhS
	gVo0PZrY+HGPT//YiuLPk+mWwSSeB5+zOage2k2TjkjlpXP+5YNf6U=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
controller driver (sound/soc/spacemit/).

Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
  - Fix RX DMA params not being set when TX is already running
  - Move hw constraints from hw_params to startup where they belong
  - Adjust FIFO trigger threshold to half FIFO size for better DMA
    efficiency

Patches 4-5 add dt-bindings for the spacemit,k3-i2s compatible and the
spacemit,fixed-sample-rate property. The K3 SoC uses the same I2S IP as
K1 but requires additional clocks (sysclk_div, common_sysclk,
common_bclk) that are shared across multiple I2S controllers.

Patches 6-7 add driver support for the fixed-sample-rate constraint and
K3 SoC with additional clocks. When multiple I2S controllers share a
common bclk, they must all use the same sample rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (7):
      ASoC: spacemit: fix RX DMA params not set when TX is running
      ASoC: spacemit: move hw constraints from hw_params to startup
      ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: dt-bindings: add fixed-sample-rate property for SpacemiT K1/K3
      ASoC: spacemit: add fixed-sample-rate constraint support
      ASoC: spacemit: add K3 SoC support with additional clocks

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  39 +++++++-
 sound/soc/spacemit/k1_i2s.c                        | 106 +++++++++++++++++----
 2 files changed, 123 insertions(+), 22 deletions(-)
---
base-commit: 02f694bcc20c664d9f4754229a3be28683c2a3f8
change-id: 20260427-k3-i2s-52ae21807466

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

