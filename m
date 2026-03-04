Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6436D9FA;
	Wed,  4 Mar 2026 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609835; cv=none; b=KoWT3QUCBdMsfmL/BdhjB6aFwsO4AaJN9jdfpb2EJS3p57wbpDm53Z/qsXd25Bv6JRIyQTW3vx3MCr+Cv89BGIyDZnI3b5gf5C+/u19G2W+OtFwKio2dB0BWyJm043r93c2vaxW88y1FXoSk+tv1ITCT2IzdTqA4SVPFtDta/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609835; c=relaxed/simple;
	bh=Axm5RT1vXW25EsCzGFah2o7AMlhcdm1PbuzuvzpOPwE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KPK+78V/x0NBTB3TK2hgJQlZb1cC+bK4y5P7olinv+iiu8JlAwvWSqXQYxU4xCRGT5BLl+5+QLj0HxNQ77S8Tei4bOjsxD7O7qoUd//DrO7NOFes35Eumnuy1DYYefHR9HKzVXr7CcRVy9IuzJoG2dkPMo1R3ipxwEIEjGe4nB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzQ2fLNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzQ2fLNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB8BC19423;
	Wed,  4 Mar 2026 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609834;
	bh=Axm5RT1vXW25EsCzGFah2o7AMlhcdm1PbuzuvzpOPwE=;
	h=From:Subject:Date:To:Cc:From;
	b=tzQ2fLNwjR8mOuf7rsaHCGTiaFUszXB9rZa8mjMLtJ+H4slRL9+vseaP1Xetrb1rP
	 D+Ra/4JVKGUkORm4axoX3JE6uar3b2RLuKa7ZRBPt06r8FhohL4T9ZH3HCNSaLLDkN
	 lHFmQuuGF8RFA/Uw13286c2TEOhauudtH5Rh0Vpx/CE3Yd6GzdZZCP46GU3eMpVeaF
	 LvyOg6mbiLat3jmkW9QJAsX0ISvOJnRiUSKJ5DAO8ioMZl+XqPY2NGlw1l6+fFTL8C
	 wZW2/1vvOxCranpDr9IeOKUnBMxb6cX6GJNa1QABK0cLqXVsrThCEUvgIN9eRR1uMn
	 lYRKUnEpCD5YA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: spacemit: k3: Add more resource to UART
Date: Wed, 04 Mar 2026 07:36:41 +0000
Message-Id: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArhp2kC/x3MQQqAIBBA0avIrBsYsxK6SrSwmmogLNQiiO6et
 HyL/x+IHIQjtOqBwJdE2X2GLhSMq/MLo0zZUFLZkKEKSeOUIp4uJJzPbcOBa9NYstYMNeTsCDz
 L/S+7/n0/mekYj2IAAAA=
X-Change-ID: 20260304-01-dts-uart-full-be53670773b5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Axm5RT1vXW25EsCzGFah2o7AMlhcdm1PbuzuvzpOPwE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+EXabe58tmIYcg3+/OAeEMhn8SlnKHAgq0Rd
 a/3F4kfK7iJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhFxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0Jfg/9FiKWNn0F4yxDIuaEf0s4fmZHXKJSDAgDkH8GKtOziZIB0r7ZJ+HD+
 Nqf8X45GqmGvCepByZh6UwBZmzuXY9pS37R8jHYhw/39FuGDuLaJ26iU4QxP8Dsr4gGJ4V09lwT
 1JbW5mkzLdVHdWCp/ouElnJIcAkEsQygsOwOf7wtCXwj0DVQ98UeachkR0FkbUcysaFY0DEpAFR
 0kT3Nor1jRrzj0HiFEMIG/P/ssNq755RsSfPfmyQ0NdHhNyun0+lr3Hj6p3RdLsLaW4LqEk7ZtO
 VgJtJf/PzUWl3NZ0kbHXSqa2FUhSZvAHt/SV+3dLpWtE4L/GlMZG/DSw5wVOWzomu6mmjso3LoG
 h2XgIP0S42FPJruiOedOup9ua34i7EADKU/NxtmAiplA22wwbqbh8cm+yBoZhVDyhS3KtW4dXNJ
 FSfM+HZJMahemyT1/emRpJobinMlLKbBwnhg3hAKO0q963IkwVbNnHfihog1fh95rDCIG76p7Eb
 EBnZEvEa+UZFhHTIsPauTupuaZOiJHMYXYxZXXQS3v/jS9YGDT922KPIsf0WYGmcryafzkscIYk
 r+U5JapiFW/ORbs4P1wwnGxlEbIyc1I4j44qRaKAP/x+TaEKUM3c+RmMf0zgrkhlXSstIlXykw9
 FdCUoHCckaA+wCjP4+E1p5GRk214rk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series try to add more resource (clock, pinctrl, reset) to UART driver,
So it will not reply on external bootloader for initialization. While doing
this, I've tried to break these patchse into more fine pieces, adding clock,
pinctrl+gpio, reset separately, then UART.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      riscv: dts: spacemit: k3: add clock tree
      riscv: dts: spacemit: k3: add pinctrl support
      riscv: dts: spacemit: k3: add GPIO support
      riscv: dts: spacemit: k3: add full resource to UART

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |   3 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  24 +++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 152 +++++++++++++++++++++++++--
 3 files changed, 169 insertions(+), 10 deletions(-)
---
base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
change-id: 20260304-01-dts-uart-full-be53670773b5

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

