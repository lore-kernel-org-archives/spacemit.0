Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF505175A81
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463159; cv=none; b=mB3sE47ENViuEcPFjQ/kF4yzvtQxVm2JBrmdldjIiyPILJvZt3Rtcpk4zzgPhjEdV1tt9QxDtTl464caPC4XJotcBbPRwZyGQ6pwltc2pJFqdR93D2QsO1913jX2odZLFvDO2bs4lloNgS6R8QgEwzdWtM8d8AtIamQCBUKeYBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463159; c=relaxed/simple;
	bh=gJFEEkd542yyDpxixeuu7zY62vgz2g2bZ4j5O3WEVBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eKIjpBwW75uLcZhUJKJ6gHFOOPMhphn/8wzma4PN164Dk6l8HJkhaHXt7ThRfyKevrC7ZuojH/+f+bt3k0cyD6dnPZVunopk2Yz4bFqrRjP1S9ggSJZP8GeUpMNlGXwBP8KUbyQWLjU0L7JY8MLmbI4MPd3jg7t/TxLAnp7WUvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: zesmtpgz7t1777463047t1a87f9a7
X-QQ-Originating-IP: 5HsW6SeMFE8TZ44kfqVi/P/ReHORJ1BN4dByUTdCtXw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 19:44:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10582357409210983648
EX-QQ-RecipientCnt: 10
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 19:44:13 +0800
Message-Id: <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell" <troy.mitchell@linux.dev>,
 "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
In-Reply-To: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7XZp9EJRpsafMnEkQmDM3bzk/B9XMtnl3I/W2rl25S6UK1
	91EbtlhgHpMspx5la4fO2tkz5eSlPMgC4rUhbXFztSAasibp13GnM1iDqxo8NSKD/qmkaVH
	mg1t3ZJb3fe1OIDXcih9GTd943HVS4hRdifkHXVPdTyV42FDsWi/d2l/Ml1jzDdo9pkmT6O
	pvCOIdiphUGTtvbiZbaSAf6Bv149qqK+OQxO6fBJ0QRbb1lcbRHLp0pY/frT3ZEwtclXHg5
	pO685gwjVSIqBqI+sC5PZxHALK9tNutsy5l/xCxQ2cCHZrbAW/EVpjk6KHbss2TPP6d4/a5
	LkejbHmKmXkOQJ5/ejEfV2ERTPMkgJ7Tmz8tB5GuubkvE4t87fxGmGrcG5aTHTpO/FQI18x
	Yc9GmBogXLUFe4yfNm/dTsjrk0oX7WzJX8mtsjSy1c7T/3J8TnqJQJ5hYUMuCVzu3OJcx0m
	fkHpsx0zVQluVZ0xOHADeT7TBCzrlhMofoxHwlvoo7qx+s78/QG6PRv/TOxHsjFQ8rbQoP4
	MiGatBjaymIbu2sOyofbyLuYhKzz3Vv218l5jaCuXmT7uXP+O/hPoHbnFlelQNfcOZakZe1
	n4sGZwfj+2InTPArjlCFiJXdtuqCicafnx6C1eP6ssuFPjbYjLz5Q87kEhALyPAQnbruoPA
	TYTX7GIFfyNOAGRfoeDX3RR/+j+Qnftiwl8P854q2KTGNSuBX0SNkM2gu+8jAVN5sZ0LTOi
	Ii1Vxd/UqimxOLO3jU0ykIVIxJbec7VVQ+y6LbRDiYzuxg7rGe2GjOK3NGdiNSBPwOZeib8
	/e/SM0QMBposglB6Bxdd00+/xv0rKhE/y3f+byjkOxpfIIc6rG+fQ0mQaSY8HWYuaQ5vXbO
	JP9RzveJbtqR/sFdBqiN4nDDiFln2xjns+eVqAsnuDy2ip4HMDjiZTrqdg41aYp/k/udDYE
	1X7zi2wuthXJ+b6A5VTKpeYxZ3seQQAFbhYLBoxPTDG98BBOybEXn0Iv3MG8BSFSA7exJPD
	Ws+7h41dM6hFpWoT1vtOEPqPCOw5Mg/RATGvprmw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Hi all,

On Mon Mar 30, 2026 at 5:58 PM CST, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.dev>
>
> Currently, the RISC-V implementation of machine_restart(), machine_halt()=
,
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
>
> This implementation fails to provide a deterministic execution environmen=
t
> for registered handlers in the restart or power-off notifier chains. Thes=
e
> chains are intended to be executed in a strict atomic and single-threaded
> context.
>
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not incremen=
t
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentificat=
ion
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
>
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
>
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Gentle ping on this patch. Is there anything I should change or any
concerns with the approach?

                          - Troy
