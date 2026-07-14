Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D77B3F2109;
	Tue, 14 Jul 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020039; cv=none; b=n8ZDp4/8u4xlOSeA0eKc/ZvJeFR2xwSILFIXLao5KpAetIDCAK142MJvlobF4lBtRpemzTpXC51XP2FyLCx9w7YXy/VVnlEGMY/GACgcnKJwlE/DCozbpIdc+3+gj4gOemS1z5kwmA+WFbWpofDQYBm4g5iVIu+asSHu3l7l7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020039; c=relaxed/simple;
	bh=EfZTxG3VLDFn6NlpEFV0YBz3ims5z2RpO6wdoF3ld9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF5sH72rB7/Bgxb5sbAHjwVbqIgbS7uFmzJ+kJuys3vvF8jr/VZsJQ7fANW9BkIkLewFuhuNrLYCXf9gHUKBfel6lopqG3F48B+c8f/GlhfUyvKAsEGy4odXE4A1w70ZpiabbY15Scx+C+coxvXOlxVQUibdC+/g2jRuH2HOr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXxoT1M1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXxoT1M1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DDF1F000E9;
	Tue, 14 Jul 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020037;
	bh=4TYgHMSI97Vz1YKihM5sWLRxeMfrv6RDGWem709JFPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FXxoT1M1UP4l5ybUNiojG3sY0Kh3riaEF0nsASbHhlSJRya/npjvTityJKxQMTbPN
	 l2qnTA1lh0GSvN1aPU22affEpNGyERlNQdiVKvzjNOE7mVCIIeyhHsMwDxbcLH1uVO
	 WTQND/4aiK/lUVQirrd2gK+9LHaMqnKfwNvcS7CF14rQLQcGplr0AHOALw65kUwXFx
	 iPfIE6aUnTJ4WFk2L4IlJQKbf+sLWhu3t9wNi4rqSqykA7ltU5oJS2g8X7vmGDo+d/
	 7V+JigOJGr1jWVlGlvUjaghsPV32Aye3hYRRQgvmBxjErRUlC/jbVL6nudaIXHu8Jx
	 C6tF/do1HYwYQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Enable SD card support
Date: Tue, 14 Jul 2026 09:07:11 +0000
Message-ID: <178372643614.19971.17353721889377239107.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610-07-k3-enable-sd-v1-1-196ae29bd091@kernel.org>
References: <20260610-07-k3-enable-sd-v1-1-196ae29bd091@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 12:34:32 +0000, Yixun Lan wrote:
> Add the device tree node of SDHCI-0 controller which found on CoM260-IFX
> board, it's currenty used for Micro SD card slot, and one GPIO pin is
> configured as card insertion/removal detection pin, the slot use 4-bit
> data bus, and up support to SDR104 speed mode.

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Enable SD card support
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=055044260e7a603ff587537651e12c8fbfbed851

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
