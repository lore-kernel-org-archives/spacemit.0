Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055013959D;
	Wed,  1 Jul 2026 00:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864909; cv=none; b=grAn6Wj1GI7M7qT3jGNYU4D9ehY1vuYT9+q+13k/Efn7ycZjkQB1hJT6SzomQzWtvDxPYRw4+HXNIYP6XL19utQXYV2mtkcC3ITtE8zpQ/lFKI+GhDyIZYsk+2EhVCq+xxwi641ba/Vyj5GNjjbnmygFQrU88cntGA7atST4H3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864909; c=relaxed/simple;
	bh=fUcNDgaltXOzL/x86jKEg0jBQVyzR3xS+vpiKAG37fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7IzVbgIQxUPX7CCKmyTii7EmwRZJOwIA+l9lvIFhwYGIFyGRqNq9CesQiJLY7mf+6fLHw0mBeXLaTdEDpj+9B6VfP33GR+yIwDxe3aYDGnnO1Vnhh++/EJREy1iLe5UuKc6hZlcf8L2MuAisZ2mA4qjbNm5aE8MyWTdLXqkA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddrOKvFJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddrOKvFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1DF1F000E9;
	Wed,  1 Jul 2026 00:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782864908;
	bh=Tpbz57NKNTsydLxlNb8KBsQaA4f/n2UQCvIOTkKm2Ts=;
	h=Date:From:To:Cc:Subject;
	b=ddrOKvFJmMD+KnDy4pgter1ApsScuWzoJ1OhQYYeSPGGOtn3QVA2o/bjwlTLB7Coj
	 Ieo/mTrhXIrfIP+9/RlDat3d0fF+fqg8kXt6YfjJj56t3qf/44CXJlhS2WsTEPDQps
	 b/474mCheQ4DxqzlGx23nJepC1JrZ0wPhs7Cup/zNbE8YLg4apDOoiYJLT380KIS5o
	 8luz3nQp6C+UdiIwqnDlne/LL17975rsGvRobJsCvKRtiFGa8BeWpmu8blqVcFmRYQ
	 02GlZouJULUpqk8HFLNmPcWZ9NdPJ4WOvxnO8J3pcIyP0HTI6ht7OhOeKwOJ6e6G8A
	 JdCYhsLrkU68w==
Date: Wed, 1 Jul 2026 00:15:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: linux-next@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, soc@kernel.org,
	spacemit@lists.linux.dev
Subject: Include in next: Switch SpacemiT SoC tree's repo
Message-ID: <20260701001506-GKA20854@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linux-Next Maintainer,

  Previously, the SpacemiT SoC tree was hosted in github.com[1],
while now we've created a new kernel tree at kernel.org[2],
so please help to update the repo url for linux-next tree to the
new one, and the other info should being unchanged, that's:
  branch for master: for-next
  branch for pending-fixes: fixes
 
  I will also switch to new repo for sending next Pull-Request to
SoC tree maintainer.

  Thank you

[1] https://github.com/spacemit-com/linux
[2] https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/

-- 
Yixun Lan (dlan)
