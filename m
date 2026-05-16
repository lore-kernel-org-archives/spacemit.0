Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4811A683B;
	Sat, 16 May 2026 02:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897235; cv=none; b=fAxbNr0E02UFoZPe9vsL+KJ3Te4Bz4rpomyKo/zrker/ifBgqgdg1ckw8ZtmfSsDsMZV3IS+ujwAPbR3uN5YFY3e6lGPp7QT5vNBf1lsQhDXvwxhpyuQeBH6CiNlOVhFLcqKo2B1J1nP7E7X77ofhIiSoZrIJeedEXSd/J4PwbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897235; c=relaxed/simple;
	bh=iqCIplJrqfaiHknlrsPCYdWY6TiMpIdZBid5zJCNkGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrFVLgBGZKTWlARvt5ERQd3P+mpidXHFMvCwRfFpBM4owPKqOga2J/LuJ9YfNPXu2CpONdpTgvJ8bCDHK9Fg3ho9YqVa7kGZ7dvT+gXqe2yUyWiGPiC3HLKeERVrMqxcmMcD+9dcUJ1zNq8GhgVq2QhxBBt4YIJJIFE4xW2O80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFuKdFAA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFuKdFAA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B8FC2BCB0;
	Sat, 16 May 2026 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778897235;
	bh=iqCIplJrqfaiHknlrsPCYdWY6TiMpIdZBid5zJCNkGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFuKdFAACaO2gG2mF0pAsPqW+U5ygN31EDpTvZADccBwfqZ5b1uYXD+79dj3KBecc
	 2x5+81wsmC1ULUYJz5AlMv0NIvq9rph5/yuzVUR+T6KePKGnRZYI+R1cxe3br2nT32
	 n/Yf+45tJcxol25prBdxczVb0J2L852cu+KS+rNElUk0YSDc4aJL1KLoIzTODETI35
	 OSCcEncLwgm38tB/no0wCVLd6ib7Lj8ARq/JXNhluhMyLR/btdczu61RW3jWQoOPuM
	 cizul79Ox73ddRKnMZjzYfROLAmNAmYgfRtfN8aUHKc5F2Dl5OHRuHZfMos8ClZKZb
	 QjNUkgUxlU9Aw==
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
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
Date: Sat, 16 May 2026 02:07:08 +0000
Message-ID: <177889719089.2290560.15121464517928343972.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
References: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Mar 2026 22:15:21 +0000, Yixun Lan wrote:
> There is one USB2.0 host in K3 SoC which use DWC3 IP but only provide
> USB2.0 functionality, and with only one USB2 PHY connected.
> 
> The USB2.0 controller on Pico-ITX board connects to a Terminus FE1.1 Hub
> which fully USB2.0 protocol compliant and provides 4 ports.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Add USB2.0 support
      https://github.com/spacemit-com/linux/commit/d3bd58f3060f28ecd30df51925a9b1f62e5e8c9b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
