Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570543D75B1;
	Tue, 28 Jul 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238523; cv=none; b=d1DxFrbNHuPgSBHLow9YV1nxk5jdarX1//noNLGGKQ4j8RsICOwgVpVxl2kmvVgIqzjzvYsfUFfvdTkE6aJ7FAlJZ0mAHV9JUzUPXkN4xEOCy6EW97h9aihwwKDgCSAbwKweypGZoGBX/TiF3TVxpKCsLV66QGf+goHLuMuS1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238523; c=relaxed/simple;
	bh=BPcrERNpAaf+dj4PAXvSbmQjEIM/I4NUpelGGqdNUZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugRmz5WvZ46wlgrPPQA9WaP6kEtjE2EgH9vsIPm+Qi9mepvKG0ogdr70Y67xq1JRnirtKcK+z61xHan90ijzFdE83s55nkfMsijfbGHRbo6qTSXMp17TtoO8nckByp2Rp3/gDV5sGFAz3lgi19LmuBtM2Pjhj0xqyjDnG5fuXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IexCStta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IexCStta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C258D1F000E9;
	Tue, 28 Jul 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238522;
	bh=axEZ2Aob5cBDcWuDLyKoSqcIBQS9SM5ZIXUN2NCp+T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IexCSttaoO1o+rsGRngGTaMZY9Irv02It4M3XzJdclIu5U/CKjtK2RjlW5yIRVZj1
	 N+N86u/mqZ0OovdYbsuvCkn5pmcqcPT5vhkTJ8Jcmo+ZOW1NDJAbbASqGRgX2DZqwO
	 aeysS/iHKo03xgQyfhzJwz60vAOFFwWIdCbcO1K5RMn+BFutgrplCAq2iCYqIaJHgK
	 TPzIcNFq1PH6Um2D2r7C4M8c+7IE75Vo3Yjd/jhCr0LegTha2ms71y5GHyDCEK0ib5
	 KCun6JpMMakJZCM40SoMz/YWPn/quZUWUx9iSHy2X4cDquU0eOTjGN8yb+DUHEqiL7
	 ZPm1knJ6XrXUQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
Date: Tue, 28 Jul 2026 11:35:15 +0000
Message-ID: <178523844266.623919.7131430665750899115.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Jul 2026 14:33:12 +0800, Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.

Applied, thanks!

[1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a225e19a4cc4e040ca0389cf0bbe209c23f5c92d
[2/2] riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=12b0d602e8642297ec369eeb99366d37c8a3a120

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
