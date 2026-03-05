Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02377231830;
	Thu,  5 Mar 2026 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672472; cv=none; b=p5vXJ8leZ0+DDSbRBH8YNVVD5jzW5WzmmPPfpaPXM44tGOmGiN48wgUSanW+2Ez0o0IBf8A8q4N/iMac18O8fcaHQHNhlZbLME4JuH0e3ow+pN7wQJ+InuOun9fpMjlYl8+g5AzlDoKLzpuexakYgTEe8klhhTN7YD/QeUH/4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672472; c=relaxed/simple;
	bh=UMf7X17drXT/2m3cWxTRejsoT3RPHLdFCh83qDuKhBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RnuWeWiiPLL7lhxX/cjmC2bqXTZe0/JrSNsrAKlHOz8gD7eTILJCD+n3ShPyMBor9EpdW9Lvj2i3O8ZjU/klTcLoJM1Q7plUzwZM9bHyDapvYaHKYld7ZuFJ5xuALSOpuuMgCjEWOPgNlke4CDXVsNWDiY4oUFYaSb4rpCAk3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvYRAxs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvYRAxs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E1C4CEF7;
	Thu,  5 Mar 2026 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772672471;
	bh=UMf7X17drXT/2m3cWxTRejsoT3RPHLdFCh83qDuKhBk=;
	h=From:Subject:Date:To:Cc:From;
	b=UvYRAxs+5RBEHlU+mO/Rd//PPziY/Xp6IgtnSnxz5RD7A6WYTXbt1ertF0Dv+h7H/
	 u72OAbDxv6m/cXSyF3qEa1VUcpAAU0cR/8p9kvz/s51DCKC0p9/F/MmdgvnNws8Vfa
	 myAFM+BphtYhlPllOkDACsX7hzJwaZFLbksMcdt/alJxrjCBbOnCx0g8DYKR4YURdr
	 iJydZMQlykUT4hpLWQfOhh0pCoQwYbCMHrghAtKMCbAnj/zKiGD/NxhEwVaIK48G1c
	 4ZOXcy3RkofLu0fxFdv35nodEBSHOH66k5/8PoXwf5w4cw/jwK3rdPDcqzBybTYvmM
	 WJ0+43FsH8xSQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Date: Thu, 05 Mar 2026 01:00:50 +0000
Message-Id: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLVqGkC/13MQQ6CMBCF4auQWTumMxQUV97DsLAwQIMB0mojI
 b27FXcu/5e8bwMvzoqHS7aBk2C9nacU+pBBM9ynXtC2qYEVl4pYIxGOOb68YVyGFRtd5spUlTL
 UQTotTjr73sFbnXqw/jm7dfcDfdcfxcT/VCBUqPPidC4q1qpor6O4SR7H2fVQxxg/GC/Vwq0AA
 AA=
X-Change-ID: 20260124-11-k3-usb2-phy-c4630b990b1f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=dlan@kernel.org;
 h=from:subject:message-id; bh=UMf7X17drXT/2m3cWxTRejsoT3RPHLdFCh83qDuKhBk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpqNXKdJlZsM5D/2qcw85wKs1DVGjsO17huAdmw
 T0AbvuC5Z6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaajVyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0V/A/+IK4XZuOOeywg4wwMq7NgDKjI1PO6lVmwLNATfV5cC6jS8o28OxsWy
 n8Y3ZD9Pj587yWj/whTswr+5zBu4jEZHksWZKZ++UkV+CWamqawtiz/hnoWXUinN5kX8KFbgQhr
 AifrUMoH6rH6U321etwiwtwX1M+qJ41mnUGav6Hasz8tOztNEbxk4nm0iJlv3Q4NBFY5w0uxHvh
 Rn0sqpVMhxjxykqvbzcFLZqIOv/GYh8XW8UV3457LuSbCvHN+Gk3TS1me+Z3Aq/4NyG5uav6pOo
 nn15TsHjKhokRbyyAV0PRI1PHgWQkgmbLNX8T/lzr2zSVZ6M2eFTzhz8GLj8ah+CLTvi+yB99mJ
 bxb7IlSsGFhYzFey8nN8duqKpYhjMxqdx0CFXBoywWP4f02kpPlW6W4Fm15mA/j3ThvycqBowlX
 2SKfw4of2mIS9tb03Y7M+3jxFDXtXv1D4Y7Tn9eZhvpuWVyxemtKARWY9RqIEoRAHnt4X+TaTx3
 cRCtg5QeMW+Bq6LZHs6iRcNihQOiLPbZVvzv4+PvnY+uAIpdYvQvTdv/qtOW5KiOua5l2KDmQ9r
 Hul04mDlzP+IG7LS3UsFtZftwLfht4gGuDFuIbt/+Af9cBSULv1nM1EuIKjz36GIEEfWyUCpKC0
 IzJ+FY4iOZWUdpm3TGvQonQb64gywc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
patch [1/2] implement a disconnect function which is needed during
next connection.

No DTS part has been inclueded in this series, instead I plan to
submit them later while adding USB host support.

I've collected all patches and pushed a complete review branch here[1],
for people who interested to test easily, which include DTS and necessary
changes, other patches may still need to improve, but sufficient for
verifying the functionality.

Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Yixun Lan <dlan@kernel.org>

Changes in v4:
- rebase to v7.0-rc1
- fix preceding open parenthesis
- drop patch 1 which already merged
- publish a test branch
- Link to v3: https://lore.kernel.org/r/20260216152653.25244-1-dlan@kernel.org

Change in v3:
 - split from v2 as bug fix
 - fix alignment to open parenthesis
 - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
 - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org

Changes in v2:
- collect ACK
- add Fixes tag
- implement separate phy_ops
- Link to v1: https://lore.kernel.org/r/20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org

---
Yixun Lan (2):
      dt-bindings: phy: spacemit: k3: add USB2 PHY support
      phy: k1-usb: k3: add USB2 PHY support

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  6 ++--
 drivers/phy/spacemit/phy-k1-usb2.c                 | 34 ++++++++++++++++++----
 2 files changed, 33 insertions(+), 7 deletions(-)
---
base-commit: d2625d793eefe7dff154361ec66fed7886781d73
change-id: 20260124-11-k3-usb2-phy-c4630b990b1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

