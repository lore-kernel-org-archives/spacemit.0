Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A843E9FB;
	Tue, 14 Jul 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020634; cv=none; b=TeSrj0jRzrey4LlE50Af0bdannC/ti7IM7f59Z4CQzLZMRDqlswF8oU2LU4wbubVtAElljmNRcItLIKJ/eYwmuENuv96tX/24Culk/kEIjs+mPX4w4M+0mCa7JW/bWD1ZNRbhBzDRLI7lDkK7zzcOF7SFafnUcp53Nd45tP0wcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020634; c=relaxed/simple;
	bh=SVmyAHXmLMVh6/uJvqsSBXTSZ3MyseaE7cCgYsQ2dNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFsPr0AhmqaalX0f5dqULWrstgLFVDNhWTa09prJaEqnFHQ4EYAZHjwStMsSM2E7LUuypEYKWDNxtRmjaElAjbyox122xZfILcfEFwl0dOz5QUVKit5jNdoRlJtdqx1s7KdBKeDgZFk2lg40ovL0h+p3R29gNHbv0jPVbWYDpO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7QLBMJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7QLBMJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B2A1F00A3E;
	Tue, 14 Jul 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020631;
	bh=uiUOk/sFGw0gjt9bqyQS2EWUFpZX9GEi9JgxdTxjRWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7QLBMJL1lnzZZcsH/Ift/fGEwTSNgaSNJ30gkHOTYPPqALcJq98nXs0p0LfHwh1Y
	 wEIZb26BpfHoy7/RUE+fw9kWyP+8HOnhsmsss3+JutPo5uf0iB/F+v7yjMrNNozHrt
	 w7gV2dgbbmPo9Cfz3ZK4CfF3rOJZ5wv0VURakIYxgMi4QkiKfZukT87VDPMWkT5gh+
	 vee613U7M9o34Hi1+9221bhcg2YZdQ4LLAZLm+ZrCGS77BIJRM+5NgPZ4mPn0G/6zr
	 IfueOEsaIQ9nhphvq6aNCYuasv3zdYxUKzZvwW9zDvu+CouL2uNxkt0GYZdxy8vEFO
	 OAXLuZQJ1BmQw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhengyu He <hezhy472013@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
Date: Tue, 14 Jul 2026 09:17:05 +0000
Message-ID: <178402057246.1569185.16366800635203852729.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
References: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jul 2026 09:38:52 +0800, Zhengyu He wrote:
> Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
> NOR flash wired to it.

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=30da556b3d351f3916d0bcb19834f29b8ac361b3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
