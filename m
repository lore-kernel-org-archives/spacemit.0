Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B838AC95;
	Mon, 20 Apr 2026 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676179; cv=none; b=agGZ6Sm+hcnr6IqLC5HN/o0eKMDY01gn35KVXMfWD7/tYhjL/e9e0iBGw4UNUs3TLYLlHaHbReecF71qz1wqbP+EW0pAUgjetqUZ3u/aevpnUDmT4pabKbwE0PqRq3zl2EzX9JHEEKk8M/39mozYnoHk9Skr4qmkSYl0u1SIPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676179; c=relaxed/simple;
	bh=00dCGcB0/P2/wrNA/yA78fISH9yP7ajstHGqOl4WqWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izfoOJBv+6pG8uHoDnlEW2TehPadezRqVLkUQZUh2pqLvAjq7dKyn7OCAH1N/7Lwbt2+0bJBbywDJR9H7/Qf8p2CKngnMGZPB1M135up1sEjJCmuBJJjGVTfkA0XLx9WzRRHKDrjMYuHs0m/TcXZPLftAMnuVt7MLEBoYWuZv74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiTdIBmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiTdIBmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50287C19425;
	Mon, 20 Apr 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676178;
	bh=00dCGcB0/P2/wrNA/yA78fISH9yP7ajstHGqOl4WqWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiTdIBmOBopOQBmLW8e5mhGYOt/R74btFeB4E1bpiwPzYq3K9nBOZ/9PvNH33tV86
	 /4h2I1BfQjB/MqFe8ZcsReWS9QYbLcWsTSsP6CUKbUpxklQUqQFc/O/g4k0Ui3Mo42
	 rcLDWwWUQjnraDnezXojTdqSm14gRno3Iy1TVFWXQndQe5OCRfzR+48zmiuY56l6ST
	 ICxY75WKWO23g+6FE2bU8fzP7k8VhZSDFablmFSdXkWaKFMm3aPYbZB8SGKw+GSjRq
	 RmDascB4B4xBiCNxwE8USWaSukL3ix7B+QLzNbuHobkE4MUMtPSkYvoOTM36IKkrUk
	 GuBLhJtDR4RIg==
Date: Mon, 20 Apr 2026 09:09:36 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
Message-ID: <20260420090936-GKB203300@kernel.org>
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>

Hi Troy,

On 16:50 Mon 20 Apr     , Troy Mitchell wrote:
> On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
> > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
> >> On 20/04/2026 10:39, Sandie Cao wrote:
> >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
> >> 
> >> Missing space after main commit msg.
> >> 
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
> >>>
> >
> > Also, the file reported in above warning DOES NOT EXIST (I checked
> > next-20260414).
> In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
> 
> properties:
>   compatible:
>     enum:
>       - spacemit,k1-pinctrl
>       - spacemit,k3-pinctrl
> 
I think you refer to wrong file, which should be
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml

> So there's no reason to use k1-i2c. As far as I can tell, while they are the same IP,
> there are subtle differences between them.
> 
But yes, the idea is correct, so NAK to this patch
>                                   - Troy

-- 
Yixun Lan (dlan)
