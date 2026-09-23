Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51A409279
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156100; cv=none; b=CqMIIaBNet/29tQqloW5GrJbfyxBMyEQ7gf0x540a0cMCRFBo8EAgMmWKx3bCr0Cel0K+Bm8W9DNSntteL9xSi0oiklvyRbwAVsdByv80VrqEgOKe6ro4G0NSKmmPRoThy8VYh0n9kpYdOUy3pVYQ/4yOdIWVzIQ4rlBED0bf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156100; c=relaxed/simple;
	bh=Va6F/EJUW/nLR1SPH0riVx2N6r3IuxepULm9EXr00Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KXh6veRia1Rk/6+ZvREeTUo9EBFVqVRWQstr6Kxyc6Wtp1kA3yxqRv6dztKdJOfuKm44lpJ8ZI+xbGKI6Fb1mpyzd3Qaj6BEWH9rkWbIKmkkRIcJUxD+WhVFWV0jMEbotngarMpBdbkN5KQE5yre1s59//wZf6i5rGWt5QdTdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ8G+Ujl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ8G+Ujl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E311F000FF;
	Wed, 23 Sep 2026 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156099;
	bh=OKToilGEvfMJ5um1ld9uiM7K3OSYLtn9JVb1KQUdz/Q=;
	h=From:Subject:Date:To:Cc;
	b=SJ8G+UjllFmrqSOYcZtm38HQB+Ilx6I9BmVPzF0Nf1TdIT8kMV5rKe6CgkE+DeLyO
	 PxSsf6DnragabiFld3BgfHHLt6NowOEF1dZiUn89wZE0hX+la1jW3gx/Nca0tZAnMp
	 m6QcMhpxW+EWdTxqK7gFRgsIykzXMtgPWmOJsMx6YSDiRcWcNix4YVxYNVExYWxDJN
	 rwO9IvQLAbtLET00SCH2/TPsD2htmQCuG5iWwl+6RugfegAC8Vh+tqvy/aIZFy38ph
	 PWJqaOeFulPnpvk31DhUc6z6UCOI+/RNiydD05nBMDIKSRzAHnRlCeD3I6/Kwm4/wD
	 lqdYnes4/zeUg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/8] spacemit: k3: add clock and reset support
Date: Wed, 23 Sep 2026 09:34:23 +0000
Message-Id: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2UEVX3sOwwDpChVAyU4iGc
 HcB49blS/5/bwIh9iRwTiZgGr340C1gdgm4uuwqQn9fGIwyB5WbDJXGJkXXBtcgk1BEGfo+cMR
 c21KpzFpzKGH590wP/9rc1+LLMtye5OIqXBe1lxj4vcVHve5+HfunM2pU6LJUGZvS0Z7cpSHuq
 N0HrqCY5/kDbBrVKNUAAAA=
X-Change-ID: 20260824-01-k3-clock-reset-support-815a0045526a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Va6F/EJUW/nLR1SPH0riVx2N6r3IuxepULm9EXr00Tw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqs50jMpVf2WX/iExLxhDhts8SDAig6mKVGQjj+
 XEmGQ0/uYKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarOdIxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1SEg//feYO3HHjSfnEgiAl6nNDWOiqMSuqzDnLIFB0RaSLNgyZl1oBAb2lE
 l9AuHQzQjRnoXSBdQkESlEP6H6xE5Ju8YJ+eCvR6DRpZxKiohJ0WWrF+n3d2o1nn/6VRmiS0CHA
 oOuhfzfwg9rdOWYHSatFtWsw+mTXbMImfdlXBxRqJEpvEMgJhDdfjq8I9MOPs9SgT3ea7hT7+TP
 J5v6DLV+J4Q0ClAsWfEK7XoJ2PplkJJoFmkwACyirRfY3yHgzeGu8OH+jgq8HjjmxB43gOX9Q8r
 MGzZXjjBZrGBiGx0cSk4JxkeILJJoCMhSfuwNnUSOO6RUMusqCdwL512WR74Y85VxyZjoljys6D
 10IeE8PyEBXua5LFtuZGFZ0D9knlWT9l0AYpePTKx3vWV2ZsETnAqubY2Dv7qR7Pflwg680jMPK
 CHbuUorj3IHw8of9n/yNrlKi0mX661ZNVNVOawW5g8MmxH9OyBTARoYukwrGqy/FwSUUeup+Nj+
 H5D3DH9oCJsblhDNhfBbM4z33K0acF1w+CRU2ZUCIr0yPfB5/f5qk57UdR8FKvd93xn9E+gW6zp
 LIxiLXJUc1309ONp/KSkylWe8fJJ+IU0NSE4SCOFjDcVf+EcQ2il72dl66B7Ls4cfJQGNmKtg4m
 X72NaFieGwO78DmSowxCXkbUCLu+pY=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series try to add clock and reset driver support for SpacemiT K3 SoC,
the patches are largely based on upstream linux framework.

The reset BITs definition lives in the same register with clock
controller which make them tight coupled, so I'm also putting reset
patches in this series.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- add complete PLL clock tables
- drop patch for SPL
- Link to v1: https://patch.msgid.link/20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org

---
Yixun Lan (8):
      clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: extract common header
      clk: spacemit: k3: add the clock tree
      clk: spacemit: k3: add CPU PLL rate tables
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 drivers/clk/spacemit/Kconfig                   |    9 +
 drivers/clk/spacemit/Makefile                  |    1 +
 drivers/clk/spacemit/clk-k3.c                  | 2049 ++++++++++++++++++++++++
 drivers/clk/spacemit/clk_common.h              |    1 +
 drivers/clk/spacemit/clk_mix.c                 |    9 +-
 drivers/clk/spacemit/clk_mix.h                 |   27 +-
 drivers/clk/spacemit/clk_pll.c                 |  124 +-
 drivers/clk/spacemit/clk_pll.h                 |   43 +-
 drivers/reset/Kconfig                          |    1 +
 drivers/reset/Makefile                         |    2 +-
 drivers/reset/spacemit/Kconfig                 |   22 +
 drivers/reset/spacemit/Makefile                |    4 +-
 drivers/reset/spacemit/reset-spacemit-common.c |   93 ++
 drivers/reset/spacemit/reset-spacemit-common.h |   40 +
 drivers/reset/spacemit/reset-spacemit-k1.c     |  128 +-
 drivers/reset/spacemit/reset-spacemit-k3.c     |  242 +++
 include/soc/spacemit/k3-reset.h                |   21 +
 include/soc/spacemit/k3-syscon.h               |  271 ++++
 18 files changed, 2955 insertions(+), 132 deletions(-)
---
base-commit: a06e89ab05eaa2b8344d521319399333cd760ae5
change-id: 20260824-01-k3-clock-reset-support-815a0045526a

Best regards,
--  
Yixun Lan <dlan@kernel.org>

