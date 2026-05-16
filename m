Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B88245031;
	Sat, 16 May 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936339; cv=none; b=TkWelhbtx461ZIj/Z+BpIu9+wsW0FsvSZCNOB9iT4HJh9IFySVT0K6N7EF7yvDeXMtKpiwuDGzZu4QjFRf3AyZ0e5y/Ix3bfGnl6JbUYpYOlqcesNDpSZKzlixiLPhOrm+d6Ha7uJqJnbjKDnUf4olHDBB79bCzuBrVLZB6ETa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936339; c=relaxed/simple;
	bh=auVXU6SCazJsqPBgoZ/g7XMs9Wwj4hhVn8V8pqTAqQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYlCamMaME+StsL5AmsqbZdX0CcylSJUrrrPJUBglOwFlsPo42D5zkD4e+yyK84RdzdAj7AVZQAGCLY+eLnPY5nykCZpUOYszauP5Ipkom3peqpo0NZLU/rDv6KbW9jtzTv0v75ytSxaoQ2+x3932aailfSY3BEgpOFlfU/yZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5p+HVJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5p+HVJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E3DC19425;
	Sat, 16 May 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936338;
	bh=auVXU6SCazJsqPBgoZ/g7XMs9Wwj4hhVn8V8pqTAqQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5p+HVJn/aTu56kytW3VJ9sXmWzC1C8w1+ewInqyB19oUvc7Fb/TkgI0oH6WjcdZx
	 DeGtrq4Lpo3wPnO3f8j+Chs1kHWxyARYy1o/nLHSAFpRQwJ+Hc3j7HSmvhUZj0wkj/
	 wc6D3I+RTXYofcMiqnRNODLFBTCdYNljyUF972DfMjo0Hub1clpXBTAXC9uJqVH5xG
	 EX8z8A7e+sw4l0q0u//JTHGd2K9Y1pw2M2Vex0sDaa/6o9xjOzdX49onaiWyxGdgGh
	 CvzNBAEdSuCt6TM1Vr1tFw7GrwDhwa22hnA8DkyyvCd2Y3iAtw1VxNKIrTRNO17bYd
	 ZQQiooy5V5vAA==
Date: Sat, 16 May 2026 12:58:56 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Message-ID: <20260516125856-GKB3675990@kernel.org>
References: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516080030.1736836-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 16:00 Sat 16 May     , Chukun Pan wrote:
> Enable the QSPI controller and the XM25QU128C SPI NOR flash on the
> OrangePi RV2 board. Add a flash partition layout from vendor UBoot.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
LGTM

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)

-- 
Yixun Lan (dlan)
