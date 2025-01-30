Received: from mail.bix.bg (mail.bix.bg [193.105.196.21])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 243161BDA95
	for <spacemit@lists.linux.dev>; Thu, 30 Jan 2025 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.105.196.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738240742; cv=none; b=aBFhBgi1GdxvHX7OWHJ3ux514OhabHQHzy5ZDhrPskONQD1MWhYao1V1vrhDXC7+8Gs0nFkwswLxWWcpqUtEGqdiXgEh5sl5Xjnw047izP+UZL965KsapAQNgViVVjk92rAVLs123QiSf4SmStpcAUDGIId3o/S8J7JVfwdxkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738240742; c=relaxed/simple;
	bh=5X1Gw2D3nBUK6Wo1qNhsMVt881bmwDacBFNRrgik31I=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Bl3q6SSX6KyHuaJmZBSAKvOw7Vx6sLG5AUyPr4pvRdZjzfRtLuTFdiuuz/2w+CizjmR+2/cXXYE8rk/YhasHp98WQIFosUmtwCMDKtLpiS70OPkyEEJunJZczXyfpAuPoC4dtPmwXQcgQ/7/iUSZXCxnZwxuwBAZ1h9DUfQ3YjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=declera.com; spf=pass smtp.mailfrom=declera.com; arc=none smtp.client-ip=193.105.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=declera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=declera.com
Received: (qmail 27132 invoked from network); 30 Jan 2025 12:32:17 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 30 Jan 2025 12:32:17 -0000
Message-ID: <4b4b0448f3482717910e2b48d43cc4ffe909c1ae.camel@declera.com>
Subject: Hello and some questions
From: Yanko Kaneti <yaneti@declera.com>
To: spacemit@lists.linux.dev
Date: Thu, 30 Jan 2025 14:32:17 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.1 (3.55.1-2.1.fc42) 
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

I was wandering is anybody from SpacemiT actually involved in this
(upstreaming) effort (i.e. at least reading this list) or is it all non-
spacemit volunteer based?

Does anybody know if https://github.com/spacemit-com/ is officially
maintained by them ?

Can anybody address some basic issues like
https://github.com/spacemit-com/linux-k1x/issues/7 before even talking
about upstreaming..

- Yanko
