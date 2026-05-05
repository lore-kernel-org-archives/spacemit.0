Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426739934C;
	Tue,  5 May 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971194; cv=none; b=uYGgEkj8PGPCAvbVsdLS03ZQW0eloYRw0XG/cOOJiWQCJd5vQ3Cw4E9H470NNmCh8cJC+eAdv+OLVeAIEvAKZxp1ggVoObsev9/xA8xTH2UzsSsOQ1BRan0f/xWrBtRsS0al8USP75OIR2YTLA0Zy59Pa3CbpummO9jL/a9EE0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971194; c=relaxed/simple;
	bh=+fxw3GWOaW5i1Rt7AYvW9ueNOp4s3QpM81hQC4XSmKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUOkno8VX/EUn6I/USX+OY9Ofvdr+IEauuCbwY9RBOFnS4TNFTy5G8SZ6AMHZkJuDhwgrKnMX7eHFZVx7lnjQSPo3PmqAdVhnNl1wuEMV9rGBoK7niwF4RC+zK3H8XZ3T4JSh8/b/jPqw6rN01bR10ffa91eYBYoH7X622y5ZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7v3zufe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7v3zufe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4D2C2BCB9;
	Tue,  5 May 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971194;
	bh=+fxw3GWOaW5i1Rt7AYvW9ueNOp4s3QpM81hQC4XSmKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7v3zufeAcj0HCHyboRNBPRPoEypDLgZ2/fsqe4kAY29sPi9yK78XL9yn1B8PnWn9
	 XXmwuDJrzUFP2sYuicTnATn8FnlXBUc03JW06Gdg1PTzjqf8Jza1c696aXvq2ckCfJ
	 0TSTgA0TY3wilxC51M7CnsoeTMMKtaRZ7vFdo+PnJCT0ETVPKAhZOnVT9GcQ8oPfiv
	 Ps/qO69DBOwnyZB0OAzORt/hKBoPQJaJZIS1dYtGc2tMO+WRfToapd60Ndm0qlUmc5
	 NIEai3nXm8hs0WI5oiLUi13dazLB7qFj1HkC+5kD7+C5KeTnyejHlP2H+y+yOwwIxy
	 acp8eDQLHFnfg==
From: Yixun Lan <dlan@kernel.org>
To: spacemit@lists.linux.dev,
	Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Date: Tue,  5 May 2026 08:53:06 +0000
Message-ID: <177797117437.466549.17292861658160797583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>
References: <20260430-reword-overstep-3be08b7eab25@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Apr 2026 19:52:12 +0100, Conor Dooley wrote:
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> 

Applied, thanks!

[1/1] dts: spacemit: set console baud rate on bpif3
      https://github.com/spacemit-com/linux/commit/24c12ca43b12c104389d9a159207d0b25779d0af

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
