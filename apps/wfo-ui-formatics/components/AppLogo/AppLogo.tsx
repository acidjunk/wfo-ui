import React, {ReactElement} from 'react';

// import Image from 'next/image';

import {EuiFlexGroup, EuiFlexItem, EuiText} from '@elastic/eui';

// import Logo from './logo.svg';

export function getAppLogo(navigationLogo: number): ReactElement {
    return (
        <EuiFlexGroup alignItems="center" css={{height: navigationLogo}}>
            {/*<EuiFlexItem grow={false}>*/}
            {/*    <Image*/}
            {/*        priority*/}
            {/*        src={Logo}*/}
            {/*        alt="Orchestrator Logo"*/}
            {/*        width={134}*/}
            {/*        height={32}*/}
            {/*        style={{marginLeft: -20, marginTop: 6}}*/}
            {/*    />*/}
            {/*</EuiFlexItem>*/}
            <EuiFlexItem grow={false} style={{marginLeft: -10, marginRight: 10}}
            >
                <EuiText color={"white"}>Email workflows</EuiText>
            </EuiFlexItem>
        </EuiFlexGroup>
    );
}
