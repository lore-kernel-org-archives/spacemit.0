Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EB3A0B05
	for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 22:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772064; cv=none; b=qWsSIGYNnGxXx0gioGNeH9/Kne5Wfa5ZWATJ2SblqBjAL4UZDufS1SHGX3HOA0s0r9umeJRGAmkeheewpVAKcbumJKQGowvoxtl/aTH+uSg3XYjWDRZkjFCngCxeQSYbyXSMCnJ529acZ1wMUBi6SvM1SnhmeLrCxI2vz3cGfGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772064; c=relaxed/simple;
	bh=0SY3FWglN3QMVDYz3oD8UJD9qmXyiMqLWULfSfwpw0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTEeJ2TQR1EJpvArsym6jui1sd/hRJePbPfaMq8EzjzlxcWMvXlStGHtt6HdasP9j9SwMS/cCx+8jaF65Jek0TFs7dIBt0QRKSBB/yQIOA6CP87XC+bHbF0iEaLlKjsuiid9YR8P67OJoko0t+VlOQfRb/6T4PuzFVrVfujuYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN7BFoNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN7BFoNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B6A1F000FF;
	Fri, 18 Sep 2026 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772062;
	bh=U2ut8MhnRGde+NfAcK9tBoxoZW+uYmB+NXxOZV866LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nN7BFoNw6F/IbGjupqiEg686x1ieDl+PNAXWEQ2ZK4xMOdalGfksWHFGjYN7Kh0pn
	 uq2sgX7VZVO3fQkWFycevHoFSaCVvstQqSY/3ZlZiKoFqahsQ833l1upwArzaWteHh
	 6CIsnKs5u9DPrwOsVV4GTDEthYAqKNvjXKJcl2RCVQF2RChnZKD43c5RkmVnRJarH4
	 XlDhfN4H7RSgZWX027u3gQlL8EDD/ZqPp7gtGmFh4QfozmAMt92ieJEBEahdZ29EcV
	 CgPEwsLK8P7xkzoT/O0zWnBmfalJoEXiqB8+3IRonk3ZfK2EJZ2ei4FrAOlCsBzqZj
	 wc6s9o/5pWauQ==
Date: Fri, 18 Sep 2026 22:54:20 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Message-ID: <20260918225420-GKB297024@kernel.org>
References: <20260804133236.205668-1-a.heider@gmail.com>
 <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>

Hi Andre,

On 11:18 Fri 18 Sep     , Andre Heider wrote:
> Hi,
> 
> friendly ping, anything left for me to do here?
> 

Not really, I will handle them shortly, there is one minor
issue, will fix it while applying (no need sending new)..

WARNING: please, no spaces at the start of a line
#33: FILE: arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts:87:
+       cpu-supply = <&buck1_0v9>;$


Thanks for the ping (and sorry for the delay)..

-- 
Yixun Lan (dlan)
