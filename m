Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D882836E;
	Sun,  2 Aug 2026 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785637305; cv=none; b=nXaabxfqiSblmwTJA0rg9YYy3g/ExUV5ZGr5aQoU/bcwZIHWcTA3xjPrU9WDz+xP4+DWiJAWRUoHkHeKRsPvV2YJ35kwUqbbx/LFoEqclTchDtE4HqHUR6a8/9mpmP94ZDNUyOL9U7wgnygNpRlQQLfwkNq4R7LW+WOXqZ6qG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785637305; c=relaxed/simple;
	bh=zbByAfr/xel+53lfOEkIBIVLkuurZVSFyQeM2rVRoao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeqlvJ3HZT6PUhxwNIAdO0dGMPCJS2LkRtOO4AbHff3l94MgX81jKJmwZAFVaedvVCimujzikYB6hZfW45+4TaWqadDn7MmVWBng3C9CFWfbLu4IPI7pEcxycrr1Z0fk4NAlRMo5MIEd75VBCXbsAdyIoS3pUmZbEEcFeiXK7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJtvdwB8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJtvdwB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F261F00AC4;
	Sun,  2 Aug 2026 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637304;
	bh=+qkDxw1M5h2ctJR13O5BI4kM8CdztxYtNjq1b+Maeoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KJtvdwB8UbvObstRE+x1s3YDw09r92Iwb6AKvLnEiAadYemPlB7JLQ23ojbD8omsM
	 h9utxB9KMY1h1Jtr6QV7WSaXfBUPROkGnZUCmQJfPOcn5cUkqG8fT20i0Ey5LbB5cq
	 z42x6ecQpJJJ0F4/6QkrDiQ3cQS40POo6sP48Yw/UqLZaPl1RG/thQIPx6vIDtk+1Y
	 xRUhsvK5DtpyWVOX0xM5M/pPV1Dob2982fXHO9AJ8VgckNN6akgh+X4CbLs8fHEjR7
	 7aFPFV/p6jSIutaoqreAIQx9nAVrofKZLW2IAU8uyAogsdBaeDBkCVgaiKgDDbqNgf
	 a033t2hNM75zQ==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Sun,  2 Aug 2026 02:21:40 +0000
Message-ID: <178563724174.1617015.10811694726448141667.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729160749.1621415-1-aurelien@aurel32.net>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 18:00:27 +0200, Aurelien Jarno wrote:
> This series adds cpu scaling support for the Milk-V Jupiter boards.
> 
> The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> 
> The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> the common part, i.e. everything but the model name and the operating
> point tables, in a shared DTSI file. This file is then included for both
> K1 and M1 variants.
> 
> [...]

Applied, thanks!

[1/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e273d298b74ea63d5d586bd50240f919a9c33fb3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
